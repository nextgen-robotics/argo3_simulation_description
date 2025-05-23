# argo3_description
ROS description package for the ARGO3 robot

![example branch parameter](https://github.com/nextgen-robotics/argo3_description/actions/workflows/ros_ci.yml/badge.svg?branch=main)

Tested on:
* Ubuntu 20.04 LTS ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
* ROS Noetic ![ROS](https://img.shields.io/badge/ros-%230A0FF9.svg?style=for-the-badge&logo=ros&logoColor=white)

## Requirements
* [roboticsgroup_upatras_gazebo_plugins](https://github.com/roboticsgroup/roboticsgroup_upatras_gazebo_plugins)
* ROS


This package contains:
* <b>xacro files</b>: these files are XML files which describe the kinematic chain, the physical properties, the sensors, the plugins that are needed to model and describe the robot in the Gazebo simulation. N.B. These files are useful also for other packages, for example move_it package, or any package which requires the URDF of the robot in the /robot_description parameter server.
* <b>sdf model files</b>: these files are single models (such as tracks, portals, train wheels and so on) that can be imported in the Gazebo world model.
* <b>world files</b>: these files describe the gazebo simulation environment.
* <b>mesh files</b>: mesh files describing the visual and/or collision properties of the links of the robot, or single SDF models.
* <b>yaml config files</b>: these configuration files are loaded by the xacro parametric files and are needed to define the robot. If you want to change some parameters of the robot, just edit these files.
* <b>executables</b>: these executables are located in the bin folder, and are utilities.


## Installation
```
ARGO_SIMULATION_WORKSPACE=argo3_simulation_ws
mkdir -p ~/$ARGO_SIMULATION_WORKSPACE/src
cd ~/$ARGO_SIMULATION_WORKSPACE/src
git clone git@github.com:nextgen-robotics/argo3_description.git
git clone https://github.com/roboticsgroup/roboticsgroup_upatras_gazebo_plugins.git
cd ..
catkin_make
```

## Usage, Examples and Tests

1. Setup the ROS environment:
```
source ~/$ARGO_SIMULATION_WORKSPACE/devel/setup.bash
```


2. Start the visualizer:
```
roslaunch argo3_description visualize.launch
```

3. Inspect the TF tree:
   ```
   roslaunch argo3_description visualize.launch show_tf:=true
   ```
4. Interact with the robot by moving its joints:
   ```
   roslaunch argo3_description visualize.launch gui:=true
   ```

* Tests:
   1. Real train world (Empty gazebo simulation - Just the scenario):
      ```
      roslaunch argo3_description test_real_train_world.test
      ```
      You can change here the __world_filename__ argument in order to change scenarios within the ones that are already saved in the urdf/worlds folder

## Notes
* This is just a robot description package. It is not meant to be run as a standalone;
* This package is used in conjunction with [argo3_simulation](https://github.com/nextgen-robotics/argo3_simulation)
* In WSL, in order to visualize the meshes, it is needed to first run this command:
  ```
   export LIBGL_ALWAYS_SOFTWARE=1
  ```