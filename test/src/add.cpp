/*
Copyright 2019 MusicScience37 (Kenta Kabashima)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
/*! \file add.cpp
 * function of addition for test
 */

#include <stdexcept>

namespace Add {

    int add(int x, int y) {
        if (x < 0) {
            throw std::runtime_error("x is negative");
        }
        if (y < 0) {
            throw std::runtime_error("y is negative");
        }
        return x + y;
    }

}