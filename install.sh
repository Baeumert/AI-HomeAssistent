#/bin/bash

#Script for install ang configuring HomeAssitant with AI
cp mqtt5/config/mosquitto.conf /docker/homeassistant/data/mqtt5/config/mosquitto.conf

echo "Please enter a Secure Password for the MQTT-User: homassistant"
read -p "MQTT Password for HomeAssitant" hapassword
echo "Please enter a Secure Password for the MQTT-User: zigbee2mqtt"
read -p "MQTT Password for Zigbee2MQTT"  z2mpassword
echo "Please enter a Secure Password for the MQTT-User: iot"
read -p "MQTT Password for IoT Devices"  iotpassword

docker -it exec mqtt5 touch /mosquitto/config/pwfile
docker -it exec mqtt5 chown root /mosquitto/config/pwfile
docker -it exec mqtt5 chgrp docker /mosquitto/config/pwfile
docker -it exec mqtt5 mosquitto_passwd /mosquitto/config/pwfile homassistant
docker -it exec mqtt5 mosquitto_passwd /mosquitto/config/pwfile zigbee2mqtt
docker -it exec mqtt5 mosquitto_passwd /mosquitto/config/pwfile iot
