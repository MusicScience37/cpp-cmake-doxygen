# cpp-cmake-doxygen

[![dockeri.co](https://dockeri.co/image/musicscience37/cpp-cmake-doxygen)](https://hub.docker.com/r/musicscience37/cpp-cmake-doxygen)

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/musicscience37/cpp-cmake-doxygen)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/musicscience37/cpp-cmake-doxygen)

![GitHub](https://img.shields.io/github/license/musicscience37/cpp-cmake-doxygen)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/MusicScience37/cpp-cmake-doxygen?label=latest)

[![pipeline status](https://gitlab.com/MusicScience37/cpp-cmake-doxygen/badges/master/pipeline.svg)](https://gitlab.com/MusicScience37/cpp-cmake-doxygen/commits/master)
[![pipeline status](https://gitlab.com/MusicScience37/cpp-cmake-doxygen/badges/develop/pipeline.svg)](https://gitlab.com/MusicScience37/cpp-cmake-doxygen/commits/develop)

This project develops a docker image for c++ development with following tools:

|                Tool                 | Version  |                                  Note                                  |
| :---------------------------------- | :------- | :--------------------------------------------------------------------- |
| [gcc](https://gcc.gnu.org/)         | 8.3.0    | gcc, g++, gcov, lcov                                                   |
| [CMake](https://cmake.org/)         | 3.16.2   |                                                                        |
| [Plantuml](http://plantuml.com/en/) | (latest) |                                                                        |
| [Doxygen](http://www.doxygen.nl/)   | 1.8.16   |                                                                        |
| [LLVM](https://llvm.org/)           | 9.0.0    | clang, clang++, clang-format, clang-tidy, llvm-profdata, llvm-cov, ... |
| [Python](https://www.python.org/)   | 3.6.7    | with pip3 command                                                      |

Repositories:

- [Gitlab](https://gitlab.com/MusicScience37/cpp-cmake-doxygen)
  : for development
- [Github](https://github.com/MusicScience37/cpp-cmake-doxygen)
  : for use in [Docker hub](https://hub.docker.com/) to build docker images
- [Docker Hub](https://hub.docker.com/r/musicscience37/cpp-cmake-doxygen)
  : for easier use of the container

## Getting Started

A [docker image built at Docker hub](https://hub.docker.com/r/musicscience37/cpp-cmake-doxygen) is available.
To get the image, execute the following command:

~~~~~{.sh}
docker pull musicscience37/cpp-cmake-doxygen
~~~~~

## Running the tests

To test, run `run_test.sh` shell script in the project root directory.

## Authors

MusicScience37 (Kenta Kabashima)

## License

Source codes in this project is licensed under the [Apache License 2.0 (Apache-2.0)](https://www.apache.org/licenses/LICENSE-2.0) - see the LICENSE.txt file for details.

The container built from Dockerfile can be used with no restriction.
