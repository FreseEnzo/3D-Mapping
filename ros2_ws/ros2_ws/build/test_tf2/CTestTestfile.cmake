# CMake generated Testfile for 
# Source directory: /home/frese/ros2_ws/src/geometry2/test_tf2
# Build directory: /home/frese/ros2_ws/build/test_tf2
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(buffer_core_test "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/build/test_tf2/test_results/test_tf2/buffer_core_test.gtest.xml" "--package-name" "test_tf2" "--output-file" "/home/frese/ros2_ws/build/test_tf2/ament_cmake_gtest/buffer_core_test.txt" "--command" "/home/frese/ros2_ws/build/test_tf2/buffer_core_test" "--gtest_output=xml:/home/frese/ros2_ws/build/test_tf2/test_results/test_tf2/buffer_core_test.gtest.xml")
set_tests_properties(buffer_core_test PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/frese/ros2_ws/build/test_tf2/buffer_core_test" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/build/test_tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/frese/ros2_ws/src/geometry2/test_tf2/CMakeLists.txt;41;ament_add_gtest;/home/frese/ros2_ws/src/geometry2/test_tf2/CMakeLists.txt;0;")
add_test(test_message_filter "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/build/test_tf2/test_results/test_tf2/test_message_filter.gtest.xml" "--package-name" "test_tf2" "--output-file" "/home/frese/ros2_ws/build/test_tf2/ament_cmake_gtest/test_message_filter.txt" "--command" "/home/frese/ros2_ws/build/test_tf2/test_message_filter" "--gtest_output=xml:/home/frese/ros2_ws/build/test_tf2/test_results/test_tf2/test_message_filter.gtest.xml")
set_tests_properties(test_message_filter PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/frese/ros2_ws/build/test_tf2/test_message_filter" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/build/test_tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/frese/ros2_ws/src/geometry2/test_tf2/CMakeLists.txt;52;ament_add_gtest;/home/frese/ros2_ws/src/geometry2/test_tf2/CMakeLists.txt;0;")
add_test(test_convert "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/build/test_tf2/test_results/test_tf2/test_convert.gtest.xml" "--package-name" "test_tf2" "--output-file" "/home/frese/ros2_ws/build/test_tf2/ament_cmake_gtest/test_convert.txt" "--command" "/home/frese/ros2_ws/build/test_tf2/test_convert" "--gtest_output=xml:/home/frese/ros2_ws/build/test_tf2/test_results/test_tf2/test_convert.gtest.xml")
set_tests_properties(test_convert PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/frese/ros2_ws/build/test_tf2/test_convert" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/build/test_tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/frese/ros2_ws/src/geometry2/test_tf2/CMakeLists.txt;62;ament_add_gtest;/home/frese/ros2_ws/src/geometry2/test_tf2/CMakeLists.txt;0;")
add_test(test_utils "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/build/test_tf2/test_results/test_tf2/test_utils.gtest.xml" "--package-name" "test_tf2" "--output-file" "/home/frese/ros2_ws/build/test_tf2/ament_cmake_gtest/test_utils.txt" "--command" "/home/frese/ros2_ws/build/test_tf2/test_utils" "--gtest_output=xml:/home/frese/ros2_ws/build/test_tf2/test_results/test_tf2/test_utils.gtest.xml")
set_tests_properties(test_utils PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/frese/ros2_ws/build/test_tf2/test_utils" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/build/test_tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/frese/ros2_ws/src/geometry2/test_tf2/CMakeLists.txt;79;ament_add_gtest;/home/frese/ros2_ws/src/geometry2/test_tf2/CMakeLists.txt;0;")
add_test(test_buffer_client_tester.launch.py "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/build/test_tf2/test_results/test_tf2/test_buffer_client_tester.launch.py.xunit.xml" "--package-name" "test_tf2" "--output-file" "/home/frese/ros2_ws/build/test_tf2/launch_test/test_buffer_client_tester.launch.py.txt" "--command" "/usr/bin/python3" "-m" "launch_testing.launch_test" "/home/frese/ros2_ws/src/geometry2/test_tf2/test/buffer_client_tester.launch.py" "--junit-xml=/home/frese/ros2_ws/build/test_tf2/test_results/test_tf2/test_buffer_client_tester.launch.py.xunit.xml" "--package-name=test_tf2")
set_tests_properties(test_buffer_client_tester.launch.py PROPERTIES  LABELS "launch_test" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/build/test_tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/launch_testing_ament_cmake/cmake/add_launch_test.cmake;131;ament_add_test;/home/frese/ros2_ws/src/geometry2/test_tf2/CMakeLists.txt;104;add_launch_test;/home/frese/ros2_ws/src/geometry2/test_tf2/CMakeLists.txt;0;")
add_test(test_static_publisher.launch.py "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/build/test_tf2/test_results/test_tf2/test_static_publisher.launch.py.xunit.xml" "--package-name" "test_tf2" "--output-file" "/home/frese/ros2_ws/build/test_tf2/launch_test/test_static_publisher.launch.py.txt" "--command" "/usr/bin/python3" "-m" "launch_testing.launch_test" "/home/frese/ros2_ws/src/geometry2/test_tf2/test/static_publisher.launch.py" "--junit-xml=/home/frese/ros2_ws/build/test_tf2/test_results/test_tf2/test_static_publisher.launch.py.xunit.xml" "--package-name=test_tf2")
set_tests_properties(test_static_publisher.launch.py PROPERTIES  LABELS "launch_test" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/build/test_tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/launch_testing_ament_cmake/cmake/add_launch_test.cmake;131;ament_add_test;/home/frese/ros2_ws/src/geometry2/test_tf2/CMakeLists.txt;115;add_launch_test;/home/frese/ros2_ws/src/geometry2/test_tf2/CMakeLists.txt;0;")
add_test(test_tf2_bullet "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/frese/ros2_ws/build/test_tf2/test_results/test_tf2/test_tf2_bullet.gtest.xml" "--package-name" "test_tf2" "--output-file" "/home/frese/ros2_ws/build/test_tf2/ament_cmake_gtest/test_tf2_bullet.txt" "--command" "/home/frese/ros2_ws/build/test_tf2/test_tf2_bullet" "--gtest_output=xml:/home/frese/ros2_ws/build/test_tf2/test_results/test_tf2/test_tf2_bullet.gtest.xml")
set_tests_properties(test_tf2_bullet PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/frese/ros2_ws/build/test_tf2/test_tf2_bullet" TIMEOUT "60" WORKING_DIRECTORY "/home/frese/ros2_ws/build/test_tf2" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/frese/ros2_ws/src/geometry2/test_tf2/CMakeLists.txt;118;ament_add_gtest;/home/frese/ros2_ws/src/geometry2/test_tf2/CMakeLists.txt;0;")
subdirs("gtest")