#!/bin/bash
set -e

# Клонируем стабильную версию приложения
git clone https://github.com/upsysops/raddit.git /home/vagrant/raddit/

# Устанавливаем зависимости
cd /home/vagrant/raddit
bundle install

# Запускаем сервис приложения и добавляем в автозагрузку
sudo systemctl start raddit
sudo systemctl enable raddit
