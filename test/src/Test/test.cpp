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
/*! \file test.cpp
 * test of addition library
 */

#include <iostream>
#include <stdexcept>
#include "../add.h"

namespace {
    //! function to try addition
    void try_add(int x, int y) {
        try {
            int res = Add::add(x, y);
            std::cout << x << " + " << y << " = " << res << std::endl;
        }
        catch (std::exception& e) {
            std::cout << x << " + " << y << " -> " << e.what() << std::endl;
        }
    }
}

//! \test test of Add::add function
int main() {
    try_add(3, 2);
    try_add(-1, 2);
    return 0;
}
