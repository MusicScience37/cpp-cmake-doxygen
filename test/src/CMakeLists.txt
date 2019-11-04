
add_library(test_add SHARED)
target_sources(test_add
    PRIVATE
        add.cpp
    PUBLIC
        add.h)
if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    target_compile_options(test_add PUBLIC --coverage)
    target_link_options(test_add PUBLIC --coverage)
elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    target_compile_options(test_add PUBLIC -fprofile-instr-generate -fcoverage-mapping)
    target_link_options(test_add PUBLIC -fprofile-instr-generate -fcoverage-mapping)
endif()

add_executable(test_add_test)
target_sources(test_add_test
    PRIVATE
        Test/test.cpp)
target_link_libraries(test_add_test PRIVATE test_add)
add_test(NAME test_add_test COMMAND test_add_test)
