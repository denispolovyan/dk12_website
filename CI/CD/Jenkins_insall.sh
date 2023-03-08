#!/bin/bash

# Оновити список пакетів та встановити необхідні пакети
sudo apt-get update
sudo apt-get install -y openjdk-11-jre

# Додати ключ для Jenkins репозиторію
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Додати репозиторій до списку джерел пакетів
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
# Оновити список пакетів та встановити Jenkins
sudo apt update
sudo apt-get install -y jenkins

# Запустити Jenkins
sudo systemctl start jenkins

# Вивести пароль розблокування 
cat /var/lib/jenkins/secrets/initialAdminPassword