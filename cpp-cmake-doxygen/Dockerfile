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
FROM musicscience37/gcc-cmake:version-1.1

# Plantuml for Doxygen
ENV PLANTUML_JAR_PATH="/usr/local/plantuml/plantuml.jar"
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        default-jre=2:1.11-68ubuntu1~18.04.1 \
        graphviz=2.40.1-2 && \
    apt-get autoremove && \
    apt-get autoclean && \
    rm -r /var/lib/apt/lists/* && \
    mkdir -p /usr/local/plantuml && \
    wget -nv https://downloads.sourceforge.net/project/plantuml/plantuml.jar \
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
        xz-utils=5.2.2-1.3 && \
    apt-get autoremove && \
    apt-get autoclean && \
    rm -r /var/lib/apt/lists/* && \
    wget -nv http://releases.llvm.org/9.0.0/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz && \
    tar xf clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz && \
    rm clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
ENV PATH=/usr/local/llvm/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04/bin:$PATH

# python3
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3-pip=9.0.1-2.3~ubuntu1.18.04.1 \
        python3-dev=3.6.7-1~18.04 \
        python3-setuptools=39.0.1-2 \
        python3-wheel=0.30.0-0.2 && \
    apt-get autoremove && \
    apt-get autoclean && \
    rm -r /var/lib/apt/lists/*

# Git
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git=1:2.17.1-1ubuntu0.5 && \
    apt-get autoremove && \
    apt-get autoclean && \
    rm -r /var/lib/apt/lists/*

WORKDIR /root

ENV CC=/usr/local/bin/gcc
ENV CXX=/usr/local/bin/g++
