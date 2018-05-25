# Controls-Other 

In this repository, we have various Controls tools 

## What to do: 

Clone repo: 
```
cd ~ 
git clone https://github.com/Texas-Aerial-Robotics/Controls-Other.git
```

--- 

## Contents of repo: 

 
### Scripts 

Contains scripts for the Nvidia Jetson for running tools as well as system monitoring 

#### How to use: 
```
cd ~/Controls-Other/Scripts/ 
./<scriptname> 
```
Example: 
```
./startsim.sh 
```


### Params 

Previous Pixhawk parameter files 

#### How to use: 
##### Either: 
1. Deploy to Pixhawk using MissionPlanner > `Full Parameter List` > `Load From File`

##### OR: 
2. Load parameters into Simulator by 
- Be in Terminal with SITL running (should see MAV messages + `MODENAME>`) 
- Run: 
```
param load ../../Controls-Other/Params/<parameterfilename> 
```
Example: 
```
param load ../../Controls-Other/Params/Sim_master.param 
```


### Launch 

Launch files for the simulator. Might want to move this to Computations repo instead 

#### How to use: 
```
cd ~/Controls-Other/Launch/ 
roslaunch <launchfilename> 
```
Example: 
```
roslaunch apm.launch
```
