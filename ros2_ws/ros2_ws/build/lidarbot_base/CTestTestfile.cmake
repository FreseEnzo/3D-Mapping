# CMake generated Testfile for 
# Source directory: /home/frese/ros2_ws/src/lidarbot/lidarbot_base
# Build directory: /home/frese/ros2_ws/build/lidarbot_base
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(motor_test "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/build/lidarbot_base/test_results/lidarbot_base/motor_test.gtest.xml" "--package-name" "lidarbot_base" "--output-file" "/home/frese/ros2_ws/build/lidarbot_base/ament_cmake_gtest/motor_test.txt" "--command" "/home/frese/ros2_ws/build/lidarbot_base/motor_test" "--gtest_output=xml:/home/frese/ros2_ws/build/lidarbot_base/test_results/lidarbot_base/motor_test.gtest.xml")
set_tests_properties(motor_test PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/frese/ros2_ws/build/lidarbot_base/motor_test" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/build/lidarbot_base" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/frese/ros2_ws/src/lidarbot/lidarbot_base/CMakeLists.txt;52;ament_add_gtest;/home/frese/ros2_ws/src/lidarbot/lidarbot_base/CMakeLists.txt;0;")
subdirs("gtest")
