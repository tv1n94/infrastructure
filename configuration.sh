#!/bin/bash
set -e

#Установка Ruby и bundler
apt-get update
apt-get install -y ruby-full build-essential git wget
gem install --no-rdoc --no-ri bundler

#Установка mongodb
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
sudo apt-get install gnupg
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get update
apt-get install -y mongodb-org

#Запуск mongodb
systemctl start mongod
systemctl enable mongod

#Настройка сервера raddit
wget https://raw.githubusercontent.com/upsysops/stuff/master/raddit.service
mv raddit.service /etc/systemd/system/raddit.service
