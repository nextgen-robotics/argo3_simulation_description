#!/bin/bash

while getopts "r:u:" arg; do
    case $arg in
        r)
        REMOTE_IP_ADDRESS=$OPTARG
        ;;
        u)
        USERNAME=$OPTARG
        ;;
        *)
        echo "Expected a remote IP ADDRESS and a USERNAME! Exiting..."
        exit 0
        ;;
    esac
done

package_path=$(rospack find argo3_description)
# rsync -a -P $USERNAME@$REMOTE_IP_ADDRESS:/home/$USERNAME/argo3_simulation_ws/src/argo3_gazebo_simulation/argo3_description/meshes/train/ $package_path/meshes/train

# rsync -a -P $USERNAME@$REMOTE_IP_ADDRESS:/home/$USERNAME/argo3_simulation_ws/src/argo3_gazebo_simulation/argo3_description/media/ $package_path/media

rsync -a -P $USERNAME@$REMOTE_IP_ADDRESS:/home/$USERNAME/argo3_simulation_ws/src/argo3_gazebo_simulation/argo3_description/meshes/train/ $package_path/models/ice_train
rsync -a -P $USERNAME@$REMOTE_IP_ADDRESS:/home/$USERNAME/argo3_simulation_ws/src/argo3_gazebo_simulation/argo3_description/media/ $package_path/media

