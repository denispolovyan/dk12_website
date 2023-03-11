#!/bin/bash
sudo apt-get update

# Оновити список пакетів та встановити необхідні пакети
sudo apt-get install apt-transport-https
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Додати репозиторій до списку джерел пакетів
sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Оновлюємось і встановлюємо DOCKER
sudo apt-get update
sudo apt-get install docker-ce -y

# Перевіряємо 
sudo docker --version
sudo usermod -aG docker ubuntu