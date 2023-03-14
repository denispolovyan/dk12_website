#!/bin/bash

sudo apt-get update

sudo apt-get install -y npm

sudo npm i 
sudo npm i -g @vue/cli
sudo npm i -g @vue/cli-service
sudo npm update -g

cd /home/ubuntu/dk12_website/ 

sudo npm run build

mv /home/ubuntu/dk12_website/CI/CD/Dockerfile /home/ubuntu/Dockerfile