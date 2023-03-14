#!/bin/bash/

sudo apt-get update
sudo apt-get install -y npm
npm i @vue/cli-service
cd /home/ubuntu/dk12_website/ 
npm run build
mv /home/ubuntu/dk12_website/CI/CD/Dockerfile /home/ubuntu/Dockerfile