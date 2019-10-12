#!/bin/bash -eu

docker build -t cpp-cmake-doxygen .
docker run --rm -it cpp-cmake-doxygen bash
