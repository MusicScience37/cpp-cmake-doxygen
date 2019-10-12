FROM gcc:latest

RUN apt update && apt upgrade -y

# CMake
WORKDIR /usr/local/cmake
RUN wget -q https://github.com/Kitware/CMake/releases/download/v3.15.4/cmake-3.15.4-Linux-x86_64.tar.gz && \
    tar xf cmake-3.15.4-Linux-x86_64.tar.gz
ENV PATH=/usr/local/cmake/cmake-3.15.4-Linux-x86_64/bin:$PATH
RUN cmake --version

# Plantuml for Doxygen
RUN apt install -y default-jre graphviz
RUN java --version
WORKDIR /usr/local/plantuml
RUN wget -q http://sourceforge.net/projects/plantuml/files/plantuml.jar
ENV PLANTUML_JAR_PATH="/usr/local/plantuml/plantuml.jar"
RUN java -jar ${PLANTUML_JAR_PATH} -version

# Doxygen
WORKDIR /usr/local/doxygen
RUN wget -q http://doxygen.nl/files/doxygen-1.8.16.linux.bin.tar.gz && \
    tar xf doxygen-1.8.16.linux.bin.tar.gz
ENV PATH=/usr/local/doxygen/doxygen-1.8.16/bin:$PATH
RUN doxygen --version

# LLVM
RUN apt install -y software-properties-common
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    add-apt-repository "deb http://apt.llvm.org/buster/ llvm-toolchain-buster-9 main" && \
    apt update
RUN apt install -y libllvm-9-ocaml-dev libllvm9 llvm-9 llvm-9-tools llvm-9-dev llvm-9-doc llvm-9-examples llvm-9-runtime \
        clang-9 clang++-9 clang-format-9 clang-tidy-9 lld-9
RUN ln -s $(which clang-9) /usr/local/bin/clang && \
    ln -s $(which clang++-9) /usr/local/bin/clang++ && \
    ln -s $(which clang-tidy-9) /usr/local/bin/clang-tidy && \
    ln -s $(which clang-format-9) /usr/local/bin/clang-format
RUN clang --version && \
    clang++ --version && \
    clang-tidy --version && \
    clang-format --version
