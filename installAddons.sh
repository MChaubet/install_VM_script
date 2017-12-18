#!/bin/bash

user=$(whoami);

commandInSu="apt-get install sudo;";
commandInSu="$commandInSu echo 'Add to sudo'; echo -e '\n\n# Added Sudoers :\n$user\tALL=(ALL:ALL) ALL' >> /etc/sudoers;";
commandInSu="$commandInSu apt-get update; apt-get upgrade;";
commandInSu="$commandInSu apt-get install build-essential module-assistant;";
commandInSu="$commandInSu echo 'Install additionnal package'; mount /media/cdrom;";
commandInSu="$commandInSu apt-get install linux-headers-$(uname -r);";
commandInSu="$commandInSu sh /media/cdrom/VBoxLinuxAdditions.run --nox11;";
commandInSu="$commandInSu shutdown -r";
su -c "$commandInSu";
