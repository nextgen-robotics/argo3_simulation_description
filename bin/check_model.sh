#!/bin/bash

debug=true

current_dir="$(dirname "$(readlink -f "$0")")"

parent_dir=$(dirname $current_dir)

echo $current_dir
echo $parent_dir

if ! [[ -d $parent_dir/tmp ]];
then
    mkdir $parent_dir/tmp
else
    if [[ $debug ]];
    then
        echo "Directory tmp already exists"
    fi
fi


source ~/argo3_simulation_ws/devel/setup.bash
xacro --inorder $parent_dir/urdf/argo3.urdf.xacro > $parent_dir/tmp/tmp.urdf
check_urdf $parent_dir/tmp/tmp.urdf