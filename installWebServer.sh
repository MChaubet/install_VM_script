#!/bin/bash

read -p "Do you want node (y/n) ? " node;
if [[ "$node" == "y" ]]; then
	read -p "Which version of node do you want (ex : 9) ? " versionNode;
	sudo curl -sL "https://deb.nodesource.com/setup_${versionNode}.x" | sudo -E bash -;
	sudo apt-get install nodejs;
fi

read -p "Do you want docker (y/n) ? " docker;
if [[ "$docker" == "y" ]]; then
	sudo apt-get remove docker docker-engine docker.io;
	sudo apt-get update;
	sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common;
	curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -;
	sudo apt-key fingerprint 0EBFCD88;
	sudo add-apt-repository \
	   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
	   $(lsb_release -cs) \
	   stable";
	sudo apt-get update;
	sudo apt-get install docker-ce;
	apt-cache madison docker-ce;
	read -p "Which version of docker do you want (ex : 17.09.0) ? " versionDocker;
	sudo apt-get install docker-ce=$versionDocker;
	sudo docker run hello-world;
fi

read -p "Do you want docker-compose (y/n) ? " dockerCompose;
if [[ "$dockerCompose" == "y" ]]; then
	read -p "Which version of docker-compose do you want (ex : 1.17.0) ? " versionDockerCompose;
	sudo curl -L "https://github.com/docker/compose/releases/download/${versionDockerCompose}/docker-compose-`uname -s`-`uname -m`" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
fi
