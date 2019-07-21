# 
# docker run -it --rm=true \
# 		-e USER=$USER -e USERID=$UID \		# bind user for file permissions
#		-v /tmp/.X11-unix:/tmp/.X11-unix \ 	# mount the X11 socket
#		-e DISPLAY=$ip:0 \ 			# pass the display
#		-v $HOME:/home/texmaker \			# mount $HOME
#		--name texmaker jgiovaresco/texmaker
# based on https://hub.docker.com/r/jgiovaresco/texmaker/ 
# and following https://hub.docker.com/r/rootproject/root-ubuntu16/ for graphics
#

FROM debian:jessie
MAINTAINER Patrik Hallsjo

RUN sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	texmaker \
	texlive-full \
	&& apt-get autoclean -y \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* 

RUN useradd texmaker \
	&& mkdir /home/texmaker \
	&& chown texmaker:texmaker /home/texmaker

USER texmaker
WORKDIR /home/texmaker

ENTRYPOINT [ "texmaker" ]
