#!/usr/bin/bash

VERSION=1.21.1
LOADER_VERSION=0.16.5
INSTALLER_VERSION=1.0.1


apt update && apt upgrade

# Install OpenJDK 21
apt-get install openjdk-21-jre-headless
# update-alternatives --config java

curl -OJ https://meta.fabricmc.net/v2/versions/loader/$VERSION/$LOADER_VERSION/$INSTALLER_VERSION/server/jar
mv fabric-server-mc.$VERSION-loader.$LOADER_VERSION-launcher.$INSTALLER_VERSION.jar fabric-server.jar

curl -SsL https://playit-cloud.github.io/ppa/key.gpg | apt-key add -
curl -SsL -o /etc/apt/sources.list.d/playit-cloud.list https://playit-cloud.github.io/ppa/playit-cloud.list
apt update &>/dev/null && apt install playit &>/dev/null && echo "Playit.gg installed" || echo "Failed to install playit"

echo "eula=true" > eula.txt
