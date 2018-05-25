export DISPLAY=:0

roscore &

sleep 3

roslaunch mavros apm.launch fcu_url:="/dev/ttyS0:921600" &

sleep 3

rosrun mavros mavsys rate --all 10 &&

rosrun flight_pkg setHome

roslaunch video_stream_opencv webcam.launch &

sleep 3

roslaunch darknet_ros darknet_ros.launch &

sleep 5

rosrun transformations_ros simpleTransform &

sleep 1

roslaunch flight_pkg follow.launch &

sleep 1

rosrun stratnode lin_reg &



