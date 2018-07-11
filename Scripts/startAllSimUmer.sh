#!/bin/bash

gnome-terminal \
	--tab -e "roslaunch roomba_control demo.launch" \
	--tab --working-directory ~/ardupilot/ArduCopter -e "sim_vehicle.py -j4 -f Gazebo --console --location=HOME"

sleep 20

gnome-terminal \
	--tab -e "roslaunch flight_pkg apmsitl.launch" \
	--tab -e "roslaunch camera_signalman camera_signalman_nodelet.launch" \
	--tab -e "roslaunch darknet_ros darknet_ros.launch" \
	--tab -e "rosrun flight_pkg setHome" \
	--tab -e "roslaunch transformations_ros transformations.launch" \
	--tab -e "roslaunch flight_pkg followScan.launch" \
	--tab -e "rosrun stratnode stratnode" \

	# --tab -e "roslaunch roomba_control roombaStart.launch"
