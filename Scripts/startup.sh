export DISPLAY=:0

sudo chmod 777 /dev/ttyS0

roscore &

sleep 3

roslaunch mavros apm.launch fcu_url:="/dev/ttyS0:921600" &

sleep 3

rosrun mavros mavsys rate --all 10 &&

rosrun flight_pkg setHome

roslaunch video_stream_opencv droneMultipleCams.launch &

roslaunch camera_signalman drone.launch &

sleep 2

roslaunch darknet_ros darknet_ros.launch &

sleep 5

roslaunch transformations_ros  transformations.launch &

sleep 1

roslaunch flight_pkg followScan.launch &

sleep 1

rosrun stratnode stratnode &

