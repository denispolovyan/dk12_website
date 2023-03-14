#!/bin/bash

sudo apt-get update

sudo apt-get install -y npm

cd /home/ubuntu/dk12_website/ 

sudo npm run build

mv /home/ubuntu/dk12_website/CI/CD/Dockerfile /home/ubuntu/Dockerfile