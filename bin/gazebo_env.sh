#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

PARENT_DIR="$(dirname ${SCRIPT_DIR})"

MODELS_DIR=${PARENT_DIR}/models

echo $SCRIPT_DIR
echo $PARENT_DIR
echo $MODELS_DIR

export GAZEBO_MODEL_PATH=$MODELS_DIR:$GAZEBO_MODEL_PATH

gazebo $PARENT_DIR/urdf/worlds/argo_undercarriage_world_working.world --verbose