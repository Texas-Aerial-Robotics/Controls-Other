export DISPLAY=:0

sudo chmod 777 /dev/ttyS0

echo "" > lastRunProcIds

current_date_time="`date +%Y-%m-%d_%H-%M-%S`"
echo $current_date_time

mkdir -p ~/TAR_logs/$current_date_time

rm latest
ln -s ~/TAR_logs/$current_date_time ~/TAR_logs/latest

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

echo "" > ~/TAR_logs/$current_date_time/video_stream_opencv.log
roslaunch video_stream_opencv droneMultipleCams.launch | sed 's/[\x01-\x1F\x7F]//g' | sed 's/\[0m//g' >> ~/TAR_logs/$current_date_time/video_stream_opencv.log &
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

roslaunch camera_signalman drone.launch &
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

sleep 2

echo "" > ~/TAR_logs/$current_date_time/darknet.log
roslaunch darknet_ros darknet_ros.launch | sed 's/[\x01-\x1F\x7F]//g' | sed 's/\[0m//g' >> ~/TAR_logs/$current_date_time/darknet.log &
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

sleep 5

echo "" > ~/TAR_logs/$current_date_time/transformations.log
roslaunch transformations_ros  transformations.launch >> ~/TAR_logs/$current_date_time/transformations.log &
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

sleep 1

echo "" > ~/TAR_logs/$current_date_time/controls.log
roslaunch flight_pkg followScan.launch | sed 's/[\x01-\x1F\x7F]//g' | sed 's/\[0m//g' >> ~/TAR_logs/$current_date_time/controls.log &
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

sleep 1

echo "" > ~/TAR_logs/$current_date_time/stratnode.log
rosrun stratnode stratnode >> ~/TAR_logs/$current_date_time/stratnode.log &
echo -n $! >> lastRunProcIds
echo -n " " >> lastRunProcIds

