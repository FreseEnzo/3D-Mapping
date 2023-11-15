# CMake generated Testfile for 
# Source directory: /home/frese/ros2_ws/src/geometry2/tf2
# Build directory: /home/frese/ros2_ws/src/build/tf2
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(copyright "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/copyright.xunit.xml" "--package-name" "tf2" "--output-file" "/home/frese/ros2_ws/src/build/tf2/ament_copyright/copyright.txt" "--command" "/opt/ros/humble/bin/ament_copyright" "--xunit-file" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/copyright.xunit.xml" "--exclude" "include/tf2/LinearMath/Matrix3x3.h" "include/tf2/LinearMath/MinMax.h" "include/tf2/LinearMath/QuadWord.h" "include/tf2/LinearMath/Quaternion.h" "include/tf2/LinearMath/Scalar.h" "include/tf2/LinearMath/Transform.h" "include/tf2/LinearMath/Vector3.h")
set_tests_properties(copyright PROPERTIES  LABELS "copyright;linter" TIMEOUT "200" WORKING_DIRECTORY "/home/frese/ros2_ws/src/geometry2/tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_copyright/cmake/ament_copyright.cmake;51;ament_add_test;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;69;ament_copyright;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;0;")
add_test(cppcheck "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/cppcheck.xunit.xml" "--package-name" "tf2" "--output-file" "/home/frese/ros2_ws/src/build/tf2/ament_cppcheck/cppcheck.txt" "--command" "/opt/ros/humble/bin/ament_cppcheck" "--xunit-file" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/cppcheck.xunit.xml" "--exclude" "include/tf2/LinearMath/Matrix3x3.h" "include/tf2/LinearMath/MinMax.h" "include/tf2/LinearMath/QuadWord.h" "include/tf2/LinearMath/Quaternion.h" "include/tf2/LinearMath/Scalar.h" "include/tf2/LinearMath/Transform.h" "include/tf2/LinearMath/Vector3.h" "--language" "c++")
set_tests_properties(cppcheck PROPERTIES  LABELS "cppcheck;linter" TIMEOUT "300" WORKING_DIRECTORY "/home/frese/ros2_ws/src/geometry2/tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_cppcheck/cmake/ament_cppcheck.cmake;66;ament_add_test;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;70;ament_cppcheck;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;0;")
add_test(cpplint "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/cpplint.xunit.xml" "--package-name" "tf2" "--output-file" "/home/frese/ros2_ws/src/build/tf2/ament_cpplint/cpplint.txt" "--command" "/opt/ros/humble/bin/ament_cpplint" "--xunit-file" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/cpplint.xunit.xml" "--exclude" "include/tf2/LinearMath/Matrix3x3.h" "include/tf2/LinearMath/MinMax.h" "include/tf2/LinearMath/QuadWord.h" "include/tf2/LinearMath/Quaternion.h" "include/tf2/LinearMath/Scalar.h" "include/tf2/LinearMath/Transform.h" "include/tf2/LinearMath/Vector3.h")
set_tests_properties(cpplint PROPERTIES  LABELS "cpplint;linter" TIMEOUT "120" WORKING_DIRECTORY "/home/frese/ros2_ws/src/geometry2/tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_cpplint/cmake/ament_cpplint.cmake;68;ament_add_test;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;74;ament_cpplint;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;0;")
add_test(lint_cmake "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/lint_cmake.xunit.xml" "--package-name" "tf2" "--output-file" "/home/frese/ros2_ws/src/build/tf2/ament_lint_cmake/lint_cmake.txt" "--command" "/opt/ros/humble/bin/ament_lint_cmake" "--xunit-file" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/lint_cmake.xunit.xml")
set_tests_properties(lint_cmake PROPERTIES  LABELS "lint_cmake;linter" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/src/geometry2/tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_lint_cmake/cmake/ament_lint_cmake.cmake;47;ament_add_test;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;75;ament_lint_cmake;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;0;")
add_test(uncrustify "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/uncrustify.xunit.xml" "--package-name" "tf2" "--output-file" "/home/frese/ros2_ws/src/build/tf2/ament_uncrustify/uncrustify.txt" "--command" "/opt/ros/humble/bin/ament_uncrustify" "--xunit-file" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/uncrustify.xunit.xml" "--language" "C++" "--exclude" "include/tf2/LinearMath/Matrix3x3.h" "include/tf2/LinearMath/MinMax.h" "include/tf2/LinearMath/QuadWord.h" "include/tf2/LinearMath/Quaternion.h" "include/tf2/LinearMath/Scalar.h" "include/tf2/LinearMath/Transform.h" "include/tf2/LinearMath/Vector3.h")
set_tests_properties(uncrustify PROPERTIES  LABELS "uncrustify;linter" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/src/geometry2/tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_uncrustify/cmake/ament_uncrustify.cmake;70;ament_add_test;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;76;ament_uncrustify;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;0;")
add_test(xmllint "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/xmllint.xunit.xml" "--package-name" "tf2" "--output-file" "/home/frese/ros2_ws/src/build/tf2/ament_xmllint/xmllint.txt" "--command" "/opt/ros/humble/bin/ament_xmllint" "--xunit-file" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/xmllint.xunit.xml")
set_tests_properties(xmllint PROPERTIES  LABELS "xmllint;linter" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/src/geometry2/tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_xmllint/cmake/ament_xmllint.cmake;50;ament_add_test;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;80;ament_xmllint;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;0;")
add_test(test_cache_unittest "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/test_cache_unittest.gtest.xml" "--package-name" "tf2" "--output-file" "/home/frese/ros2_ws/src/build/tf2/ament_cmake_gtest/test_cache_unittest.txt" "--command" "/home/frese/ros2_ws/src/build/tf2/test_cache_unittest" "--gtest_output=xml:/home/frese/ros2_ws/src/build/tf2/test_results/tf2/test_cache_unittest.gtest.xml")
set_tests_properties(test_cache_unittest PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/frese/ros2_ws/src/build/tf2/test_cache_unittest" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/src/build/tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;84;ament_add_gtest;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;0;")
add_test(test_static_cache_unittest "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/test_static_cache_unittest.gtest.xml" "--package-name" "tf2" "--output-file" "/home/frese/ros2_ws/src/build/tf2/ament_cmake_gtest/test_static_cache_unittest.txt" "--command" "/home/frese/ros2_ws/src/build/tf2/test_static_cache_unittest" "--gtest_output=xml:/home/frese/ros2_ws/src/build/tf2/test_results/tf2/test_static_cache_unittest.gtest.xml")
set_tests_properties(test_static_cache_unittest PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/frese/ros2_ws/src/build/tf2/test_static_cache_unittest" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/src/build/tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;89;ament_add_gtest;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;0;")
add_test(test_simple_tf2_core "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/test_simple_tf2_core.gtest.xml" "--package-name" "tf2" "--output-file" "/home/frese/ros2_ws/src/build/tf2/ament_cmake_gtest/test_simple_tf2_core.txt" "--command" "/home/frese/ros2_ws/src/build/tf2/test_simple_tf2_core" "--gtest_output=xml:/home/frese/ros2_ws/src/build/tf2/test_results/tf2/test_simple_tf2_core.gtest.xml")
set_tests_properties(test_simple_tf2_core PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/frese/ros2_ws/src/build/tf2/test_simple_tf2_core" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/src/build/tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;94;ament_add_gtest;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;0;")
add_test(test_time "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/src/build/tf2/test_results/tf2/test_time.gtest.xml" "--package-name" "tf2" "--output-file" "/home/frese/ros2_ws/src/build/tf2/ament_cmake_gtest/test_time.txt" "--command" "/home/frese/ros2_ws/src/build/tf2/test_time" "--gtest_output=xml:/home/frese/ros2_ws/src/build/tf2/test_results/tf2/test_time.gtest.xml")
set_tests_properties(test_time PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/frese/ros2_ws/src/build/tf2/test_time" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/src/build/tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;104;ament_add_gtest;/home/frese/ros2_ws/src/geometry2/tf2/CMakeLists.txt;0;")
subdirs("gtest")
