#!/bin/sh -eu

# Copyright 2019 MusicScience37 (Kenta Kabashima)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# run tests in a docker container

# move to the test directory
cd $(dirname $0)

echo ""
echo ">> build with cmake and gcc"
echo ""
rm -rf build
mkdir -p build/gcc
cd build/gcc
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ../..
cmake --build .
ctest -V .

echo ""
echo ">> collect coverage with lcov (and gcov)"
echo ""
COV=./coverage/coverage.info
HTML=./coverage/html
ROOT=$(realpath $(dirname $0))/src
mkdir coverage
lcov --rc lcov_branch_coverage=1 --directory ./ --capture --output-file $COV
lcov --rc lcov_branch_coverage=1 --extract $COV "${ROOT}/*" --output-file $COV
lcov --rc lcov_branch_coverage=1 --remove $COV "*/Test/*" --output-file $COV
lcov --rc lcov_branch_coverage=1 --list $COV
genhtml --rc lcov_branch_coverage=1 --output-directory $HTML $COV

echo ""
echo ">> build with cmake and clang"
echo ""
cd ../
mkdir clang
cd clang
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DCMAKE_CXX_COMPILER=clang++ ../..
cmake --build .
mkdir coverage
export LLVM_PROFILE_FILE=$(pwd)/coverage/coverage_%p.profraw
ctest -V .

echo ""
echo ">> collect coverage with llvm-profdata llvm-cov"
echo ""
cd coverage
llvm-profdata merge -o coverage.profdata coverage_*.profraw
llvm-cov show -instr-profile=coverage.profdata \
    -object ../src/libtest_add.so -object ../src/test_add_test \
    -ignore-filename-regex='Test/*' \
    > coverage.txt
llvm-cov report -instr-profile=coverage.profdata \
    -object ../src/libtest_add.so -object ../src/test_add_test \
    -ignore-filename-regex='Test/*' \
    | tee coverage_summary.txt
line_cov=$(cat coverage_summary.txt | awk '{ if (NF > 0) { last = $NF } } END { print last }')
echo "Line Coverage: $line_cov"

cd ../../..
echo ""
echo ">> PlantUML"
echo ""
mkdir build/uml
java -jar ${PLANTUML_JAR_PATH} uml/test_sequence.puml -o $(pwd)/build/uml -tsvg

echo ""
echo ">> doxygen"
echo ""
doxygen

echo ""
echo ">> clang-tidy"
echo ""
mkdir build/clang-tidy
clang-tidy -checks=* -p=build/gcc/compile_commands.json src/add.cpp \
    | tee build/clang-tidy/clang-tidy.log

echo ""
echo ">> python-pip"
echo ""
cd build
git clone https://github.com/PSPDFKit-labs/clang-tidy-to-junit.git clang-tidy-to-junit
cat clang-tidy/clang-tidy.log \
    | python3 clang-tidy-to-junit/clang-tidy-to-junit.py $(realpath $(dirname $0)) \
    > clang-tidy/clang-tidy-junit.xml
pip3 install junit2html
python3 -m junit2htmlreport clang-tidy/clang-tidy-junit.xml clang-tidy/clang-tidy-junit.html
