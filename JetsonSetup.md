This file explains the installation process for flashing and installing all the software for a flight ready jetson

#Jetpack 

Download Jetpack from https://developer.nvidia.com/embedded/jetpack
You will have to make a free dev account with nvidia 

run the installer 
```
chmod 777 JetPack-L4T-3.2-linux-x64_b196.run
./JetPack-L4T-3.2-linux-x64_b196.run
```

select tx2

on the components manager page select no action on the host system installs
select no action on all the other software on the target except for 
-File system and OS 
-Drivers
-Flash OS image to target
-Cuda 9




