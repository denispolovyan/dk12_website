#!/bin/bash

# Оновити список пакетів та встановити необхідні пакети
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk wget

# Додати ключ для Jenkins репозиторію
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

# Додати репозиторій до списку джерел пакетів
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Оновити список пакетів та встановити Jenkins
sudo apt-get update
sudo apt-get install -y jenkins

# Запустити Jenkins
sudo systemctl start jenkins

# Вивести статус Jenkins
sudo systemctl status jenkins