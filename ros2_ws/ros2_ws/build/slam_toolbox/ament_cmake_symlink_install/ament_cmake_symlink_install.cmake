# generated from
# ament_cmake_core/cmake/symlink_install/ament_cmake_symlink_install.cmake.in

# create empty symlink install manifest before starting install step
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/symlink_install_manifest.txt")

#
# Reimplement CMake install(DIRECTORY) command to use symlinks instead of
# copying resources.
#
# :param cmake_current_source_dir: The CMAKE_CURRENT_SOURCE_DIR when install
#   was invoked
# :type cmake_current_source_dir: string
# :param ARGN: the same arguments as the CMake install command.
# :type ARGN: various
#
function(ament_cmake_symlink_install_directory cmake_current_source_dir)
  cmake_parse_arguments(ARG "OPTIONAL" "DESTINATION" "DIRECTORY;PATTERN;PATTERN_EXCLUDE" ${ARGN})
  if(ARG_UNPARSED_ARGUMENTS)
    message(FATAL_ERROR "ament_cmake_symlink_install_directory() called with "
      "unused/unsupported arguments: ${ARG_UNPARSED_ARGUMENTS}")
  endif()

  # make destination absolute path and ensure that it exists
  if(NOT IS_ABSOLUTE "${ARG_DESTINATION}")
    set(ARG_DESTINATION "/home/frese/ros2_ws/install/slam_toolbox/${ARG_DESTINATION}")
  endif()
  if(NOT EXISTS "${ARG_DESTINATION}")
    file(MAKE_DIRECTORY "${ARG_DESTINATION}")
  endif()

  # default pattern to include
  if(NOT ARG_PATTERN)
    set(ARG_PATTERN "*")
  endif()

  # iterate over directories
  foreach(dir ${ARG_DIRECTORY})
    # make dir an absolute path
    if(NOT IS_ABSOLUTE "${dir}")
      set(dir "${cmake_current_source_dir}/${dir}")
    endif()

    if(EXISTS "${dir}")
      # if directory has no trailing slash
      # append folder name to destination
      set(destination "${ARG_DESTINATION}")
      string(LENGTH "${dir}" length)
      math(EXPR offset "${length} - 1")
      string(SUBSTRING "${dir}" ${offset} 1 dir_last_char)
      if(NOT dir_last_char STREQUAL "/")
        get_filename_component(destination_name "${dir}" NAME)
        set(destination "${destination}/${destination_name}")
      else()
        # remove trailing slash
        string(SUBSTRING "${dir}" 0 ${offset} dir)
      endif()

      # glob recursive files
      set(relative_files "")
      foreach(pattern ${ARG_PATTERN})
        file(
          GLOB_RECURSE
          include_files
          RELATIVE "${dir}"
          "${dir}/${pattern}"
        )
        if(NOT include_files STREQUAL "")
          list(APPEND relative_files ${include_files})
        endif()
      endforeach()
      foreach(pattern ${ARG_PATTERN_EXCLUDE})
        file(
          GLOB_RECURSE
          exclude_files
          RELATIVE "${dir}"
          "${dir}/${pattern}"
        )
        if(NOT exclude_files STREQUAL "")
          list(REMOVE_ITEM relative_files ${exclude_files})
        endif()
      endforeach()
      list(SORT relative_files)

      foreach(relative_file ${relative_files})
        set(absolute_file "${dir}/${relative_file}")
        # determine link name for file including destination path
        set(symlink "${destination}/${relative_file}")

        # ensure that destination exists
        get_filename_component(symlink_dir "${symlink}" PATH)
        if(NOT EXISTS "${symlink_dir}")
          file(MAKE_DIRECTORY "${symlink_dir}")
        endif()

        _ament_cmake_symlink_install_create_symlink("${absolute_file}" "${symlink}")
      endforeach()
    else()
      if(NOT ARG_OPTIONAL)
        message(FATAL_ERROR
          "ament_cmake_symlink_install_directory() can't find '${dir}'")
      endif()
    endif()
  endforeach()
endfunction()

#
# Reimplement CMake install(FILES) command to use symlinks instead of copying
# resources.
#
# :param cmake_current_source_dir: The CMAKE_CURRENT_SOURCE_DIR when install
#   was invoked
# :type cmake_current_source_dir: string
# :param ARGN: the same arguments as the CMake install command.
# :type ARGN: various
#
function(ament_cmake_symlink_install_files cmake_current_source_dir)
  cmake_parse_arguments(ARG "OPTIONAL" "DESTINATION;RENAME" "FILES" ${ARGN})
  if(ARG_UNPARSED_ARGUMENTS)
    message(FATAL_ERROR "ament_cmake_symlink_install_files() called with "
      "unused/unsupported arguments: ${ARG_UNPARSED_ARGUMENTS}")
  endif()

  # make destination an absolute path and ensure that it exists
  if(NOT IS_ABSOLUTE "${ARG_DESTINATION}")
    set(ARG_DESTINATION "/home/frese/ros2_ws/install/slam_toolbox/${ARG_DESTINATION}")
  endif()
  if(NOT EXISTS "${ARG_DESTINATION}")
    file(MAKE_DIRECTORY "${ARG_DESTINATION}")
  endif()

  if(ARG_RENAME)
    list(LENGTH ARG_FILES file_count)
    if(NOT file_count EQUAL 1)
    message(FATAL_ERROR "ament_cmake_symlink_install_files() called with "
      "RENAME argument but not with a single file")
    endif()
  endif()

  # iterate over files
  foreach(file ${ARG_FILES})
    # make file an absolute path
    if(NOT IS_ABSOLUTE "${file}")
      set(file "${cmake_current_source_dir}/${file}")
    endif()

    if(EXISTS "${file}")
      # determine link name for file including destination path
      get_filename_component(filename "${file}" NAME)
      if(NOT ARG_RENAME)
        set(symlink "${ARG_DESTINATION}/${filename}")
      else()
        set(symlink "${ARG_DESTINATION}/${ARG_RENAME}")
      endif()
      _ament_cmake_symlink_install_create_symlink("${file}" "${symlink}")
    else()
      if(NOT ARG_OPTIONAL)
        message(FATAL_ERROR
          "ament_cmake_symlink_install_files() can't find '${file}'")
      endif()
    endif()
  endforeach()
endfunction()

#
# Reimplement CMake install(PROGRAMS) command to use symlinks instead of copying
# resources.
#
# :param cmake_current_source_dir: The CMAKE_CURRENT_SOURCE_DIR when install
#   was invoked
# :type cmake_current_source_dir: string
# :param ARGN: the same arguments as the CMake install command.
# :type ARGN: various
#
function(ament_cmake_symlink_install_programs cmake_current_source_dir)
  cmake_parse_arguments(ARG "OPTIONAL" "DESTINATION" "PROGRAMS" ${ARGN})
  if(ARG_UNPARSED_ARGUMENTS)
    message(FATAL_ERROR "ament_cmake_symlink_install_programs() called with "
      "unused/unsupported arguments: ${ARG_UNPARSED_ARGUMENTS}")
  endif()

  # make destination an absolute path and ensure that it exists
  if(NOT IS_ABSOLUTE "${ARG_DESTINATION}")
    set(ARG_DESTINATION "/home/frese/ros2_ws/install/slam_toolbox/${ARG_DESTINATION}")
  endif()
  if(NOT EXISTS "${ARG_DESTINATION}")
    file(MAKE_DIRECTORY "${ARG_DESTINATION}")
  endif()

  # iterate over programs
  foreach(file ${ARG_PROGRAMS})
    # make file an absolute path
    if(NOT IS_ABSOLUTE "${file}")
      set(file "${cmake_current_source_dir}/${file}")
    endif()

    if(EXISTS "${file}")
      # determine link name for file including destination path
      get_filename_component(filename "${file}" NAME)
      set(symlink "${ARG_DESTINATION}/${filename}")
      _ament_cmake_symlink_install_create_symlink("${file}" "${symlink}")
    else()
      if(NOT ARG_OPTIONAL)
        message(FATAL_ERROR
          "ament_cmake_symlink_install_programs() can't find '${file}'")
      endif()
    endif()
  endforeach()
endfunction()

#
# Reimplement CMake install(TARGETS) command to use symlinks instead of copying
# resources.
#
# :param TARGET_FILES: the absolute files, replacing the name of targets passed
#   in as TARGETS
# :type TARGET_FILES: list of files
# :param ARGN: the same arguments as the CMake install command except that
#   keywords identifying the kind of type and the DESTINATION keyword must be
#   joined with an underscore, e.g. ARCHIVE_DESTINATION.
# :type ARGN: various
#
function(ament_cmake_symlink_install_targets)
  cmake_parse_arguments(ARG "OPTIONAL" "ARCHIVE_DESTINATION;DESTINATION;LIBRARY_DESTINATION;RUNTIME_DESTINATION"
    "TARGETS;TARGET_FILES" ${ARGN})
  if(ARG_UNPARSED_ARGUMENTS)
    message(FATAL_ERROR "ament_cmake_symlink_install_targets() called with "
      "unused/unsupported arguments: ${ARG_UNPARSED_ARGUMENTS}")
  endif()

  # iterate over target files
  foreach(file ${ARG_TARGET_FILES})
    if(NOT IS_ABSOLUTE "${file}")
      message(FATAL_ERROR "ament_cmake_symlink_install_targets() target file "
        "'${file}' must be an absolute path")
    endif()

    # determine destination of file based on extension
    set(destination "")
    get_filename_component(fileext "${file}" EXT)
    if(fileext STREQUAL ".a" OR fileext STREQUAL ".lib")
      set(destination "${ARG_ARCHIVE_DESTINATION}")
    elseif(fileext STREQUAL ".dylib" OR fileext MATCHES "\\.so(\\.[0-9]+)?(\\.[0-9]+)?(\\.[0-9]+)?$")
      set(destination "${ARG_LIBRARY_DESTINATION}")
    elseif(fileext STREQUAL "" OR fileext STREQUAL ".dll" OR fileext STREQUAL ".exe")
      set(destination "${ARG_RUNTIME_DESTINATION}")
    endif()
    if(destination STREQUAL "")
      set(destination "${ARG_DESTINATION}")
    endif()

    # make destination an absolute path and ensure that it exists
    if(NOT IS_ABSOLUTE "${destination}")
      set(destination "/home/frese/ros2_ws/install/slam_toolbox/${destination}")
    endif()
    if(NOT EXISTS "${destination}")
      file(MAKE_DIRECTORY "${destination}")
    endif()

    if(EXISTS "${file}")
      # determine link name for file including destination path
      get_filename_component(filename "${file}" NAME)
      set(symlink "${destination}/${filename}")
      _ament_cmake_symlink_install_create_symlink("${file}" "${symlink}")
    else()
      if(NOT ARG_OPTIONAL)
        message(FATAL_ERROR
          "ament_cmake_symlink_install_targets() can't find '${file}'")
      endif()
    endif()
  endforeach()
endfunction()

function(_ament_cmake_symlink_install_create_symlink absolute_file symlink)
  # register symlink for being removed during install step
  file(APPEND "${CMAKE_CURRENT_BINARY_DIR}/symlink_install_manifest.txt"
    "${symlink}\n")

  # avoid any work if correct symlink is already in place
  if(EXISTS "${symlink}" AND IS_SYMLINK "${symlink}")
    get_filename_component(destination "${symlink}" REALPATH)
    get_filename_component(real_absolute_file "${absolute_file}" REALPATH)
    if(destination STREQUAL real_absolute_file)
      message(STATUS "Up-to-date symlink: ${symlink}")
      return()
    endif()
  endif()

  message(STATUS "Symlinking: ${symlink}")
  if(EXISTS "${symlink}" OR IS_SYMLINK "${symlink}")
    file(REMOVE "${symlink}")
  endif()

  execute_process(
    COMMAND "/usr/bin/cmake" "-E" "create_symlink"
      "${absolute_file}"
      "${symlink}"
  )
  # the CMake command does not provide a return code so check manually
  if(NOT EXISTS "${symlink}" OR NOT IS_SYMLINK "${symlink}")
    get_filename_component(destination "${symlink}" REALPATH)
    message(FATAL_ERROR
      "Could not create symlink '${symlink}' pointing to '${absolute_file}'")
  endif()
endfunction()

# end of template

message(STATUS "Execute custom install script")

# begin of custom install code

# install(DIRECTORY "include/" "DESTINATION" "include/")
ament_cmake_symlink_install_directory("/home/frese/ros2_ws/src/slam_toolbox/lib/karto_sdk" DIRECTORY "include/" "DESTINATION" "include/")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_index/share/ament_index/resource_index/rosidl_interfaces/slam_toolbox" "DESTINATION" "share/ament_index/resource_index/rosidl_interfaces")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_index/share/ament_index/resource_index/rosidl_interfaces/slam_toolbox" "DESTINATION" "share/ament_index/resource_index/rosidl_interfaces")

# install(DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/rosidl_generator_c/slam_toolbox/" "DESTINATION" "include/slam_toolbox/slam_toolbox" "PATTERN" "*.h")
ament_cmake_symlink_install_directory("/home/frese/ros2_ws/src/slam_toolbox" DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/rosidl_generator_c/slam_toolbox/" "DESTINATION" "include/slam_toolbox/slam_toolbox" "PATTERN" "*.h")

# install(FILES "/opt/ros/humble/lib/python3.10/site-packages/ament_package/template/environment_hook/library_path.sh" "DESTINATION" "share/slam_toolbox/environment")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/opt/ros/humble/lib/python3.10/site-packages/ament_package/template/environment_hook/library_path.sh" "DESTINATION" "share/slam_toolbox/environment")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/library_path.dsv" "DESTINATION" "share/slam_toolbox/environment")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/library_path.dsv" "DESTINATION" "share/slam_toolbox/environment")

# install(DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/rosidl_typesupport_fastrtps_c/slam_toolbox/" "DESTINATION" "include/slam_toolbox/slam_toolbox" "PATTERN_EXCLUDE" "*.cpp")
ament_cmake_symlink_install_directory("/home/frese/ros2_ws/src/slam_toolbox" DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/rosidl_typesupport_fastrtps_c/slam_toolbox/" "DESTINATION" "include/slam_toolbox/slam_toolbox" "PATTERN_EXCLUDE" "*.cpp")

# install(DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/rosidl_generator_cpp/slam_toolbox/" "DESTINATION" "include/slam_toolbox/slam_toolbox" "PATTERN" "*.hpp")
ament_cmake_symlink_install_directory("/home/frese/ros2_ws/src/slam_toolbox" DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/rosidl_generator_cpp/slam_toolbox/" "DESTINATION" "include/slam_toolbox/slam_toolbox" "PATTERN" "*.hpp")

# install(DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/rosidl_typesupport_fastrtps_cpp/slam_toolbox/" "DESTINATION" "include/slam_toolbox/slam_toolbox" "PATTERN_EXCLUDE" "*.cpp")
ament_cmake_symlink_install_directory("/home/frese/ros2_ws/src/slam_toolbox" DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/rosidl_typesupport_fastrtps_cpp/slam_toolbox/" "DESTINATION" "include/slam_toolbox/slam_toolbox" "PATTERN_EXCLUDE" "*.cpp")

# install(DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/rosidl_typesupport_introspection_c/slam_toolbox/" "DESTINATION" "include/slam_toolbox/slam_toolbox" "PATTERN" "*.h")
ament_cmake_symlink_install_directory("/home/frese/ros2_ws/src/slam_toolbox" DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/rosidl_typesupport_introspection_c/slam_toolbox/" "DESTINATION" "include/slam_toolbox/slam_toolbox" "PATTERN" "*.h")

# install(DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/rosidl_typesupport_introspection_cpp/slam_toolbox/" "DESTINATION" "include/slam_toolbox/slam_toolbox" "PATTERN" "*.hpp")
ament_cmake_symlink_install_directory("/home/frese/ros2_ws/src/slam_toolbox" DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/rosidl_typesupport_introspection_cpp/slam_toolbox/" "DESTINATION" "include/slam_toolbox/slam_toolbox" "PATTERN" "*.hpp")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/pythonpath.sh" "DESTINATION" "share/slam_toolbox/environment")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/pythonpath.sh" "DESTINATION" "share/slam_toolbox/environment")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/pythonpath.dsv" "DESTINATION" "share/slam_toolbox/environment")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/pythonpath.dsv" "DESTINATION" "share/slam_toolbox/environment")

# install(DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_python/slam_toolbox/slam_toolbox.egg-info/" "DESTINATION" "local/lib/python3.10/dist-packages/slam_toolbox-2.7.0-py3.10.egg-info")
ament_cmake_symlink_install_directory("/home/frese/ros2_ws/src/slam_toolbox" DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_python/slam_toolbox/slam_toolbox.egg-info/" "DESTINATION" "local/lib/python3.10/dist-packages/slam_toolbox-2.7.0-py3.10.egg-info")

# install(DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/rosidl_generator_py/slam_toolbox/" "DESTINATION" "local/lib/python3.10/dist-packages/slam_toolbox" "PATTERN_EXCLUDE" "*.pyc" "PATTERN_EXCLUDE" "__pycache__")
ament_cmake_symlink_install_directory("/home/frese/ros2_ws/src/slam_toolbox" DIRECTORY "/home/frese/ros2_ws/build/slam_toolbox/rosidl_generator_py/slam_toolbox/" "DESTINATION" "local/lib/python3.10/dist-packages/slam_toolbox" "PATTERN_EXCLUDE" "*.pyc" "PATTERN_EXCLUDE" "__pycache__")

# install("TARGETS" "slam_toolbox__rosidl_typesupport_fastrtps_c__pyext" "DESTINATION" "local/lib/python3.10/dist-packages/slam_toolbox")
include("/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_symlink_install_targets_0_${CMAKE_INSTALL_CONFIG_NAME}.cmake")

# install("TARGETS" "slam_toolbox__rosidl_typesupport_introspection_c__pyext" "DESTINATION" "local/lib/python3.10/dist-packages/slam_toolbox")
include("/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_symlink_install_targets_1_${CMAKE_INSTALL_CONFIG_NAME}.cmake")

# install("TARGETS" "slam_toolbox__rosidl_typesupport_c__pyext" "DESTINATION" "local/lib/python3.10/dist-packages/slam_toolbox")
include("/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_symlink_install_targets_2_${CMAKE_INSTALL_CONFIG_NAME}.cmake")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/Pause.idl" "DESTINATION" "share/slam_toolbox/srv")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/Pause.idl" "DESTINATION" "share/slam_toolbox/srv")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/ClearQueue.idl" "DESTINATION" "share/slam_toolbox/srv")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/ClearQueue.idl" "DESTINATION" "share/slam_toolbox/srv")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/ToggleInteractive.idl" "DESTINATION" "share/slam_toolbox/srv")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/ToggleInteractive.idl" "DESTINATION" "share/slam_toolbox/srv")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/Clear.idl" "DESTINATION" "share/slam_toolbox/srv")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/Clear.idl" "DESTINATION" "share/slam_toolbox/srv")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/SaveMap.idl" "DESTINATION" "share/slam_toolbox/srv")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/SaveMap.idl" "DESTINATION" "share/slam_toolbox/srv")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/LoopClosure.idl" "DESTINATION" "share/slam_toolbox/srv")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/LoopClosure.idl" "DESTINATION" "share/slam_toolbox/srv")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/MergeMaps.idl" "DESTINATION" "share/slam_toolbox/srv")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/MergeMaps.idl" "DESTINATION" "share/slam_toolbox/srv")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/AddSubmap.idl" "DESTINATION" "share/slam_toolbox/srv")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/AddSubmap.idl" "DESTINATION" "share/slam_toolbox/srv")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/DeserializePoseGraph.idl" "DESTINATION" "share/slam_toolbox/srv")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/DeserializePoseGraph.idl" "DESTINATION" "share/slam_toolbox/srv")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/SerializePoseGraph.idl" "DESTINATION" "share/slam_toolbox/srv")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_adapter/slam_toolbox/srv/SerializePoseGraph.idl" "DESTINATION" "share/slam_toolbox/srv")

# install(FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/Pause.srv" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/Pause.srv" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/Pause_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/Pause_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/Pause_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/Pause_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/ClearQueue.srv" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/ClearQueue.srv" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/ClearQueue_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/ClearQueue_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/ClearQueue_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/ClearQueue_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/ToggleInteractive.srv" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/ToggleInteractive.srv" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/ToggleInteractive_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/ToggleInteractive_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/ToggleInteractive_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/ToggleInteractive_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/Clear.srv" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/Clear.srv" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/Clear_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/Clear_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/Clear_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/Clear_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/SaveMap.srv" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/SaveMap.srv" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/SaveMap_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/SaveMap_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/SaveMap_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/SaveMap_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/LoopClosure.srv" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/LoopClosure.srv" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/LoopClosure_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/LoopClosure_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/LoopClosure_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/LoopClosure_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/MergeMaps.srv" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/MergeMaps.srv" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/MergeMaps_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/MergeMaps_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/MergeMaps_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/MergeMaps_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/AddSubmap.srv" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/AddSubmap.srv" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/AddSubmap_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/AddSubmap_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/AddSubmap_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/AddSubmap_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/DeserializePoseGraph.srv" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/DeserializePoseGraph.srv" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/DeserializePoseGraph_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/DeserializePoseGraph_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/DeserializePoseGraph_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/DeserializePoseGraph_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/SerializePoseGraph.srv" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/src/slam_toolbox/srvs/SerializePoseGraph.srv" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/SerializePoseGraph_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/SerializePoseGraph_Request.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/SerializePoseGraph_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/srvs/SerializePoseGraph_Response.msg" "DESTINATION" "share/slam_toolbox/srvs")

# install(FILES "rviz_plugins.xml" "DESTINATION" "share/slam_toolbox/")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "rviz_plugins.xml" "DESTINATION" "share/slam_toolbox/")

# install(FILES "solver_plugins.xml" "DESTINATION" "share/slam_toolbox/")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "solver_plugins.xml" "DESTINATION" "share/slam_toolbox/")

# install("TARGETS" "async_slam_toolbox_node" "sync_slam_toolbox_node" "localization_slam_toolbox_node" "map_and_localization_slam_toolbox_node" "merge_maps_kinematic" "toolbox_common" "SlamToolboxPlugin" "ceres_solver_plugin" "async_slam_toolbox" "sync_slam_toolbox" "localization_slam_toolbox" "lifelong_slam_toolbox" "map_and_localization_slam_toolbox" "kartoSlamToolbox" "ARCHIVE_DESTINATION" "lib" "LIBRARY_DESTINATION" "lib" "RUNTIME_DESTINATION" "lib/slam_toolbox")
include("/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_symlink_install_targets_3_${CMAKE_INSTALL_CONFIG_NAME}.cmake")

# install(DIRECTORY "include/" "DESTINATION" "include")
ament_cmake_symlink_install_directory("/home/frese/ros2_ws/src/slam_toolbox" DIRECTORY "include/" "DESTINATION" "include")

# install(DIRECTORY "launch" "DESTINATION" "share/slam_toolbox" "PATTERN_EXCLUDE" "lifelong_launch.py")
ament_cmake_symlink_install_directory("/home/frese/ros2_ws/src/slam_toolbox" DIRECTORY "launch" "DESTINATION" "share/slam_toolbox" "PATTERN_EXCLUDE" "lifelong_launch.py")

# install(DIRECTORY "config" "DESTINATION" "share/slam_toolbox")
ament_cmake_symlink_install_directory("/home/frese/ros2_ws/src/slam_toolbox" DIRECTORY "config" "DESTINATION" "share/slam_toolbox")

# install(FILES "solver_plugins.xml" "rviz_plugins.xml" "DESTINATION" "share")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "solver_plugins.xml" "rviz_plugins.xml" "DESTINATION" "share")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/slam_toolbox" "DESTINATION" "share/ament_index/resource_index/package_run_dependencies")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/slam_toolbox" "DESTINATION" "share/ament_index/resource_index/package_run_dependencies")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/slam_toolbox" "DESTINATION" "share/ament_index/resource_index/parent_prefix_path")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/slam_toolbox" "DESTINATION" "share/ament_index/resource_index/parent_prefix_path")

# install(FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh" "DESTINATION" "share/slam_toolbox/environment")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh" "DESTINATION" "share/slam_toolbox/environment")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/ament_prefix_path.dsv" "DESTINATION" "share/slam_toolbox/environment")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/ament_prefix_path.dsv" "DESTINATION" "share/slam_toolbox/environment")

# install(FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh" "DESTINATION" "share/slam_toolbox/environment")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh" "DESTINATION" "share/slam_toolbox/environment")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/path.dsv" "DESTINATION" "share/slam_toolbox/environment")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/path.dsv" "DESTINATION" "share/slam_toolbox/environment")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/local_setup.bash" "DESTINATION" "share/slam_toolbox")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/local_setup.bash" "DESTINATION" "share/slam_toolbox")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/local_setup.sh" "DESTINATION" "share/slam_toolbox")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/local_setup.sh" "DESTINATION" "share/slam_toolbox")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/local_setup.zsh" "DESTINATION" "share/slam_toolbox")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/local_setup.zsh" "DESTINATION" "share/slam_toolbox")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/local_setup.dsv" "DESTINATION" "share/slam_toolbox")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/local_setup.dsv" "DESTINATION" "share/slam_toolbox")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/package.dsv" "DESTINATION" "share/slam_toolbox")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_environment_hooks/package.dsv" "DESTINATION" "share/slam_toolbox")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_index/share/ament_index/resource_index/packages/slam_toolbox" "DESTINATION" "share/ament_index/resource_index/packages")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_index/share/ament_index/resource_index/packages/slam_toolbox" "DESTINATION" "share/ament_index/resource_index/packages")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_index/share/ament_index/resource_index/rviz_common__pluginlib__plugin/slam_toolbox" "DESTINATION" "share/ament_index/resource_index/rviz_common__pluginlib__plugin")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_index/share/ament_index/resource_index/rviz_common__pluginlib__plugin/slam_toolbox" "DESTINATION" "share/ament_index/resource_index/rviz_common__pluginlib__plugin")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_index/share/ament_index/resource_index/slam_toolbox__pluginlib__plugin/slam_toolbox" "DESTINATION" "share/ament_index/resource_index/slam_toolbox__pluginlib__plugin")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_index/share/ament_index/resource_index/slam_toolbox__pluginlib__plugin/slam_toolbox" "DESTINATION" "share/ament_index/resource_index/slam_toolbox__pluginlib__plugin")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/rosidl_cmake-extras.cmake" "DESTINATION" "share/slam_toolbox/cmake")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/rosidl_cmake-extras.cmake" "DESTINATION" "share/slam_toolbox/cmake")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_export_dependencies/ament_cmake_export_dependencies-extras.cmake" "DESTINATION" "share/slam_toolbox/cmake")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_export_dependencies/ament_cmake_export_dependencies-extras.cmake" "DESTINATION" "share/slam_toolbox/cmake")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_export_include_directories/ament_cmake_export_include_directories-extras.cmake" "DESTINATION" "share/slam_toolbox/cmake")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_export_include_directories/ament_cmake_export_include_directories-extras.cmake" "DESTINATION" "share/slam_toolbox/cmake")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_export_libraries/ament_cmake_export_libraries-extras.cmake" "DESTINATION" "share/slam_toolbox/cmake")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_export_libraries/ament_cmake_export_libraries-extras.cmake" "DESTINATION" "share/slam_toolbox/cmake")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_export_targets/ament_cmake_export_targets-extras.cmake" "DESTINATION" "share/slam_toolbox/cmake")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_export_targets/ament_cmake_export_targets-extras.cmake" "DESTINATION" "share/slam_toolbox/cmake")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/rosidl_cmake_export_typesupport_targets-extras.cmake" "DESTINATION" "share/slam_toolbox/cmake")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/rosidl_cmake_export_typesupport_targets-extras.cmake" "DESTINATION" "share/slam_toolbox/cmake")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/rosidl_cmake_export_typesupport_libraries-extras.cmake" "DESTINATION" "share/slam_toolbox/cmake")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/rosidl_cmake/rosidl_cmake_export_typesupport_libraries-extras.cmake" "DESTINATION" "share/slam_toolbox/cmake")

# install(FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_core/slam_toolboxConfig.cmake" "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_core/slam_toolboxConfig-version.cmake" "DESTINATION" "share/slam_toolbox/cmake")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_core/slam_toolboxConfig.cmake" "/home/frese/ros2_ws/build/slam_toolbox/ament_cmake_core/slam_toolboxConfig-version.cmake" "DESTINATION" "share/slam_toolbox/cmake")

# install(FILES "/home/frese/ros2_ws/src/slam_toolbox/package.xml" "DESTINATION" "share/slam_toolbox")
ament_cmake_symlink_install_files("/home/frese/ros2_ws/src/slam_toolbox" FILES "/home/frese/ros2_ws/src/slam_toolbox/package.xml" "DESTINATION" "share/slam_toolbox")
