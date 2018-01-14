#!/bin/bash

cd ~/gazebo_ws/ && gazebo --verbose worlds/iris_irlock_demo.world &
cd ~/ardupilot/ArduCopter/ && sim_vehicle.py -f gazebo-iris --console -I0 
