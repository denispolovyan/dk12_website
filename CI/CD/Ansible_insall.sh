#!/bin/bash

# Оновлюємо пакети
sudo apt update

# Встановлюємо необхідні залежності
sudo apt install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

# Перевіряємо версію Ansible
ansible --version