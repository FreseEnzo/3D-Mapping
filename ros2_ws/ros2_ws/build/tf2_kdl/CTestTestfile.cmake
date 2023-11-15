# CMake generated Testfile for 
# Source directory: /home/frese/ros2_ws/src/geometry2/tf2_kdl
# Build directory: /home/frese/ros2_ws/build/tf2_kdl
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_kdl "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/build/tf2_kdl/test_results/tf2_kdl/test_kdl.gtest.xml" "--package-name" "tf2_kdl" "--output-file" "/home/frese/ros2_ws/build/tf2_kdl/ament_cmake_gtest/test_kdl.txt" "--command" "/home/frese/ros2_ws/build/tf2_kdl/test_kdl" "--gtest_output=xml:/home/frese/ros2_ws/build/tf2_kdl/test_results/tf2_kdl/test_kdl.gtest.xml")
set_tests_properties(test_kdl PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/frese/ros2_ws/build/tf2_kdl/test_kdl" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/build/tf2_kdl" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/frese/ros2_ws/src/geometry2/tf2_kdl/CMakeLists.txt;50;ament_add_gtest;/home/frese/ros2_ws/src/geometry2/tf2_kdl/CMakeLists.txt;0;")
subdirs("gtest")
