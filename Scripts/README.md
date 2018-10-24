## This folder contains scripts that are helpful for Controls team: 

### JetsonHealth.sh 
- Logs temperature using `temp` script from below 
- Also logs how much CPU and Mem we're using 
- Useful for seeing how hard we're running the Jetsons 

### pushLogs 
- This script automatically backs up logs to github
- SETUP: log must be in a git folder with ssh. Make sure the logDir variable is pathed to the correct directory. All logs to be pushed must begin with "log"

### startROS 
- Builds and starts our ROS package on the Jetson 
- `startup.sh` is probably a better implementation 

### startsim.sh 
- Runs the two simulator start commands 

### startup.sh 
- Starts the required tools (`roscore` and `roslaunch`) for running our flight code 
- Starts up our flight package 
- For Jetson, add to `.bashrc` for inflight console: `multitail -s 2 --retry-all --no-repeat -ci green controls.log -ci yellow darknet.log -ci blue stratnode.log transformations.log -ci cyan video_stream_opencv.log`

### temp 
- Shows the temperature of the CPU in Celcius and Farenheit 
- Useful for seeing how hard we're running the Jetsons 

### timesync.bat 
- Basically just restarts the Windows timekeeping service twice and asks to resync from Internet Time. This is used to keep clocks happy when dualbooting Windows and Linux. **You must have internet access before running this script.** 
- I had this script in my startup folder `C:\Users\**Username**\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup` (easily accessible by opening "Run" and typing `shell:startup`). Then I had a shortcut to the script on my Desktop in case my internet didn't connect in time and I needed to run it again. 


### gitpull.sh 
- pulls the latest version of a git repo. 
- assumes to be run from catkin_ws/src
