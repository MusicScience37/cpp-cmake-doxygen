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
#
FROM musicscience37/gcc-cmake:version-1.2

# Plantuml for Doxygen
ENV PLANTUML_JAR_PATH="/usr/local/plantuml/plantuml.jar"
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        default-jre=2:1.11-72 \
        graphviz=2.40.1-7build1 && \
    apt-get autoremove && \
    apt-get autoclean && \
    rm -r /var/lib/apt/lists/* && \
    mkdir -p /usr/local/plantuml && \
    wget -nv http://sourceforge.net/projects/plantuml/files/plantuml.1.2020.0.jar/download \
        -O ${PLANTUML_JAR_PATH} && \
    java -jar ${PLANTUML_JAR_PATH} -version

# Doxygen
WORKDIR /usr/local/doxygen
RUN wget -nv http://doxygen.nl/files/doxygen-1.8.16.linux.bin.tar.gz && \
    tar xf doxygen-1.8.16.linux.bin.tar.gz && \
    rm doxygen-1.8.16.linux.bin.tar.gz
ENV PATH=/usr/local/doxygen/doxygen-1.8.16/bin:$PATH

# LLVM
WORKDIR /usr/local/llvm
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        llvm-dev=1:9.0-49~exp1 \
        clang=1:9.0-49~exp1 \
        libomp-dev=1:9.0-49~exp1 \
        clang-format=1:9.0-49~exp1 \
        clang-tidy=1:9.0-49~exp1 && \
    apt-get autoremove && \
    apt-get autoclean && \
    rm -r /var/lib/apt/lists/*

# python3
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3-pip=18.1-5 \
        python3-dev=3.7.5-1 \
        python3-setuptools=41.1.0-1 \
        python3-wheel=0.32.3-2 && \
    apt-get autoremove && \
    apt-get autoclean && \
    rm -r /var/lib/apt/lists/*

# Git
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git=1:2.20.1-2ubuntu1.19.10.1 && \
    apt-get autoremove && \
    apt-get autoclean && \
    rm -r /var/lib/apt/lists/*

WORKDIR /root

ENV CC=/usr/local/bin/gcc
ENV CXX=/usr/local/bin/g++
