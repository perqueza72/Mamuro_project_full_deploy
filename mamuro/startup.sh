#!/bin/sh

cd ./back
sudo docker build . -t go_server:1.0
cd ./../front
sudo docker build . -t vue_mamuro_front:1.0
cd ./../data
sudo docker build . -t zinc_db:1.0
cd ./../../indexer_go
sudo docker build . -t zinc_indexer:0.1
