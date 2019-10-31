# cpp-cmake-doxygen

[![dockeri.co](https://dockeri.co/image/musicscience37/cpp-cmake-doxygen)](https://hub.docker.com/r/musicscience37/cpp-cmake-doxygen)

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/MusicScience37/cpp-cmake-doxygen?label=latest)

[![pipeline status](https://gitlab.com/MusicScience37/cpp-cmake-doxygen/badges/master/pipeline.svg)](https://gitlab.com/MusicScience37/cpp-cmake-doxygen/commits/master)
[![pipeline status](https://gitlab.com/MusicScience37/cpp-cmake-doxygen/badges/develop/pipeline.svg)](https://gitlab.com/MusicScience37/cpp-cmake-doxygen/commits/develop)

This project develops a docker image for c++ development with following tools:

- [gcc](https://gcc.gnu.org/)
- [CMake](https://cmake.org/)
- [Doxygen](http://www.doxygen.nl/)
- [Plantuml](http://plantuml.com/en/)
- [clang](https://clang.llvm.org/) and related tools in LLVM
- [Python3](https://www.python.org/) with pip command

Repositories:

- [Gitlab](https://gitlab.com/MusicScience37/cpp-cmake-doxygen)
  : for development
- [Github](https://github.com/MusicScience37/cpp-cmake-doxygen)
  : for use in [Docker hub](https://hub.docker.com/) to build docker images

## Getting Started

A [docker image built at Docker hub](https://hub.docker.com/r/musicscience37/cpp-cmake-doxygen) is available.
To get the image, execute the following command:

~~~~~{.sh}
docker pull musicscience37/cpp-cmake-doxygen
~~~~~

## Running the tests

Tests of commands are done in build process.

## Authors

MusicScience37 (Kenta Kabashima)

## License

Source codes in this project is licensed under the [Apache License 2.0 (Apache-2.0)](https://www.apache.org/licenses/LICENSE-2.0) - see the LICENSE.txt file for details.

The container built from Dockerfile can be used with no restriction.
