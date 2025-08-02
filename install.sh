#/bin/bash

#Script for install ang configuring HomeAssitant with AI
docker compose pull
mkdir -p /docker/homeassistant/data/mqtt5/config/
sudo cp mqtt5/config/mosquitto.conf /docker/homeassistant/data/mqtt5/config/mosquitto.conf
sudo touch /docker/homeassistant/data/mqtt5/config/pwfile
sudo chmod 0700 /docker/homeassistant/data/mqtt5/config/pwfile
sudo chown root -R /docker/homeassistant/data/mqtt5/
sudo chgrp docker -R /docker/homeassistant/data/mqtt5/



echo "Please enter a Secure Password for the MQTT-User: homassistant"
read -p "MQTT Password for HomeAssitant: " hapassword
echo "Please enter a Secure Password for the MQTT-User: zigbee2mqtt"
read -p "MQTT Password for Zigbee2MQTT: "  z2mpassword
echo "Please enter a Secure Password for the MQTT-User: iot"
read -p "MQTT Password for IoT Devices: "  iotpassword

docker exec -it mqtt5 mosquitto_passwd /mosquitto/config/pwfile homassistant
docker exec -it mqtt5 mosquitto_passwd /mosquitto/config/pwfile zigbee2mqtt
docker exec -it mqtt5 mosquitto_passwd /mosquitto/config/pwfile iot
