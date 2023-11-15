import os
from pathlib import Path
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.conditions import IfCondition
from launch.conditions import UnlessCondition
from launch.actions import DeclareLaunchArgument
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import ThisLaunchFileDir
from launch.actions import ExecuteProcess
from launch.substitutions import LaunchConfiguration, PythonExpression
from launch_ros.actions import Node

def generate_launch_description():

    ld = LaunchDescription()
    tf_laser_frame_base_link = Node(package = "tf2_ros", 
                executable = "static_transform_publisher",
                arguments = ["0", "0", "0", "0", "0","0","1","base_link", "laser_frame"])
    bno055 = Node(
            package='imu_filter_madgwick', executable='imu_filter_madgwick_node', output='screen',
            parameters=[{'use_mag': False, 
                         'world_frame':'odom', 
                         'publish_tf':True}],
            remappings=[('imu/data_raw', '/bno055/imu')])
            
    laser_odometry = Node(
                package='rf2o_laser_odometry',
                executable='rf2o_laser_odometry_node',
                name='rf2o_laser_odometry',
                output='screen',
                parameters=[{
                    'laser_scan_topic' : '/scan',
                    'odom_topic' : '/odom_rf2o',
                    'publish_tf' : True,
                    'base_frame_id' : 'base_link',
                    'odom_frame_id' : 'odom',
                    'init_pose_from_topic' : '',
                    'freq' : 20.0}],
            )
            
    use_sim_time = LaunchConfiguration('use_sim_time')
    slam_params_file = LaunchConfiguration('slam_params_file')

    declare_use_sim_time_argument = DeclareLaunchArgument(
        'use_sim_time',
        default_value='false',
        description='Use simulation/Gazebo clock')
    declare_slam_params_file_cmd = DeclareLaunchArgument(
        'slam_params_file',
        default_value=os.path.join(get_package_share_directory("slam_toolbox"),
                                   'config', 'mapper_params_online_async.yaml'),
        description='Full path to the ROS2 parameters file to use for the slam_toolbox node')

    start_async_slam_toolbox_node = Node(
        parameters=[
          slam_params_file,
          {'use_sim_time': use_sim_time}
        ],
        package='slam_toolbox',
        executable='async_slam_toolbox_node',
        name='slam_toolbox',
        output='screen')
   
   
    ld.add_action(tf_laser_frame_base_link)
    ld.add_action(declare_use_sim_time_argument)
    ld.add_action(laser_odometry)
    ld.add_action(bno055)
    ld.add_action(declare_slam_params_file_cmd)
    ld.add_action(start_async_slam_toolbox_node)

    return ld
   
