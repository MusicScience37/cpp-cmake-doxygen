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

# test of building a library and a test
rm -rf build
mkdir build
cd build
cmake ..
cmake --build .
ctest -V .

# collect test coverage
COV=./coverage/coverage.info
HTML=./coverage/html
ROOT=$(realpath $(dirname $0))/src
mkdir coverage
lcov --rc lcov_branch_coverage=1 --directory ./ --capture --output-file $COV
lcov --rc lcov_branch_coverage=1 --extract $COV "${ROOT}/*" --output-file $COV
lcov --rc lcov_branch_coverage=1 --remove $COV "*/Test/*" --output-file $COV
lcov --rc lcov_branch_coverage=1 --list $COV
genhtml --rc lcov_branch_coverage=1 --output-directory $HTML $COV
