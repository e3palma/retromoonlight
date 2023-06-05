#!/bin/bash
OS=$(cat /etc/os-release | grep VERSION_CODENAME | awk -F'=' '{printf $2}')
echo "$OS"
echo -e "\nAdding Moonlight to Sources List..."
## new 
if grep -q "deb [signed-by=/usr/share/keyrings/moonlight-game-streaming-moonlight-embedded-archive-keyring.gpg] https://dl.cloudsmith.io/public/moonlight-game-streaming/moonlight-embedded/deb/raspbian buster main" /etc/apt/sources.list.d/moonlight-game-streaming-moonlight-embedded.list; then
    echo -e "NOTE: Moonlight Source Exists - Skipping"
else
    echo -e "Adding Moonlight to Sources List"
    curl -1sLf 'https://dl.cloudsmith.io/public/moonlight-game-streaming/moonlight-embedded/setup.deb.sh' | distro=raspbian codename=$OS sudo -E bash
fi

echo -e "\nUpdating System..."
apt-get update -y

echo -e "\nInstalling Moonlight..."
cd ..

sudo apt-get update -y

## no longer needed due to deb package ##
#sudo apt-get install git libopus0 libexpat1 libasound2 libudev1 libavahi-client3 libcurl4 libevdev2 libenet7 libssl-dev libopus-dev libasound2-dev libudev-dev libavahi-client-dev libcurl4-openssl-dev libevdev-dev libexpat1-dev libpulse-dev uuid-dev libenet-dev cmake gcc g++ fakeroot debhelper -y

#sudo apt install rbp-userland-dev-osmc libraspberrypi0 rbp-userland-osmc
#sudo apt-get install libraspberrypi-dev -y

#git clone https://github.com/irtimmer/moonlight-embedded.git
#cd moonlight-embedded
#git submodule update --init
#fakeroot debian/rules binary
#mkdir build
#cd build/
#cmake ../
#make
#sudo make install
#sudo ldconfig


sudo apt install moonlight-embedded

cd retromoonlight

echo -e "\nMoonlight Installed!"
