# TexmakerDocker
Texmaker, https://www.xm1math.net/texmaker/ in a debian docker environment with texlive-full. This provides everything which may need to be used for latex but is quite large. A future project will be to include all used/physics tex-packages in apt-get. Based on https://hub.docker.com/r/jgiovaresco/texmaker/.

Follow instructions from: https://hub.docker.com/r/rootproject/root-ubuntu16/ to run graphics, also below:

Windows To enable graphics, you must have Xming installed. Make sure Xming is whitelisted in the Windows firewall when prompted. After installing Xming, white-list the IP-address of the Docker containers in Xming by running the following command in PowerShell as administrator: Add-Content 'C:\Program Files (x86)\Xming\X0.hosts' "rn10.0.75.2" Restart Xming and start the container with the following command: docker run --rm -it -e DISPLAY=10.0.75.1:0 rootproject/root-ubuntu16

Linux To use graphics, make sure you are in an X11 session and run the following command: docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --rm -it --user $(id -u) rootproject/root-ubuntu16

OSX To use graphics on OSX, make sure XQuarz is installed. After installing, open XQuartz, and go to XQuartz, Preferences, select the Security tab, and tick the box "Allow connections from network clients". Then exit XQuarz. Afterwards, open a terminal and run the following commands: ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}') This will grab your IP address on the local network. Run echo $ip to make sure it was successfull. If nothing is displayed, replace en0 with en1 or a higher number in the command. xhost + $ip This will start XQuartz and whitelist your local IP address. Finally, you can start up ROOT with the following command: docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$ip:0 rootproject/root-ubuntu16
