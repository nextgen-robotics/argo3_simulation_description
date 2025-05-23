#!/bin/bash

debug=true
current_dir="$(dirname "$(readlink -f "$0")")"

parent_dir=$(dirname $current_dir)

if ! [[ -d  $parent_dir/resources ]];
then
    mkdir $parent_dir/resources
    mkdir -p $parent_dir/resources/meshes/argo
    mkdir -p $parent_dir/resources/meshes/manipulator
else
    if [[ $debug ]];
    then
        echo "[ DEBUG ]: resources directory alredy exists!..."
    fi
fi

source ~/argo3_simulation_ws/devel/setup.bash

# Generate the URDF model of the ARGO3 robot
xacro --inorder $parent_dir/urdf/argo3.urdf.xacro > $parent_dir/resources/argo3.urdf include_plugins:=false include_sensors:=false include_lights:=false


# Copy the argo mesh
cp -r $parent_dir/meshes/argo/ $parent_dir/resources/meshes/

# Copy the manipulator mesh
cp -r $parent_dir/meshes/manipulator/ $parent_dir/resources/meshes/


# Edit now the URDF file

python3.8 $parent_dir/bin/edit_urdf.py -f $parent_dir/resources/argo3.urdf


