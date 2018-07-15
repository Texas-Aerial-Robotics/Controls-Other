export DISPLAY=:0

sudo chmod 777 /dev/ttyS0

echo "" > lastRunProcIds

roscore &
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

sleep 3

roslaunch mavros apm.launch fcu_url:="/dev/ttyS0:921600" &
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

sleep 3

rosrun mavros mavsys rate --all 10 &&
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

rosrun flight_pkg setHome

roslaunch video_stream_opencv droneMultipleCams.launch &
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

roslaunch camera_signalman drone.launch &
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

sleep 2

roslaunch darknet_ros darknet_ros.launch &
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

sleep 5

roslaunch transformations_ros  transformations.launch >> transformations.log &
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

sleep 1

echo "" > controls.log
roslaunch flight_pkg followScan.launch >> controls.log &
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

sleep 1

echo "" > stratnode.log
rosrun stratnode stratnode >> stratnode.log &
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

