# argo3_simulation_description
Gazebo description package for the ARGO3 robot

![example branch parameter](https://github.com/nextgen-robotics/argo3_description/actions/workflows/ros_ci.yml/badge.svg?branch=main)

Tested on:
* Ubuntu 20.04 LTS ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
* ROS Noetic ![ROS](https://img.shields.io/badge/ros-%230A0FF9.svg?style=for-the-badge&logo=ros&logoColor=white)

## Requirements
* [roboticsgroup_upatras_gazebo_plugins](https://github.com/roboticsgroup/roboticsgroup_upatras_gazebo_plugins)
* ROS


This package contains:
* <b>sdf model files</b>: these files are single models (such as tracks, portals, train wheels and so on) that can be imported in the Gazebo world model.
* <b>world files</b>: these files describe the gazebo simulation environment.
* <b>mesh files</b>: mesh files describing the visual and/or collision properties of the tracks and trains
* <b>executables</b>: these executables are located in the bin folder, and are utilities.


## Installation
```
ARGO_SIMULATION_WORKSPACE=argo3_simulation_ws
mkdir -p ~/$ARGO_SIMULATION_WORKSPACE/src
cd ~/$ARGO_SIMULATION_WORKSPACE/src
git clone git@github.com:nextgen-robotics/argo3_simulation_description.git
git clone https://github.com/roboticsgroup/roboticsgroup_upatras_gazebo_plugins.git
cd ..
catkin_make
```

## Usage, Examples and Tests

1. Setup the ROS environment:
```
source ~/$ARGO_SIMULATION_WORKSPACE/devel/setup.bash
```

2 Tests:
   1. Real train world (Empty gazebo simulation - Just the scenario):
      ```
      roslaunch argo3_description test_real_train_world.test
      ```
      You can change here the __world_filename__ argument in order to change scenarios within the ones that are already saved in the urdf/worlds folder

## Notes
* This is just a gazebo description package. It is not meant to be run as a standalone;
* This package is used in conjunction with [argo3_simulation](https://github.com/nextgen-robotics/argo3_simulation)
* In WSL, in order to visualize the meshes, it is needed to first run this command:
  ```
   export LIBGL_ALWAYS_SOFTWARE=1
  ```
