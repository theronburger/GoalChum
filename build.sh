#!/bin/bash
echo
echo "-------------------- 🚀 Building GoalChum --------------------"
echo
echo "-------- 💀 Killing docker container (if running) ------------"
sudo docker kill goalchum
echo
echo "--------------- 🧹 Cleaning up previous build ----------------"
sudo rm -rf /home/theron/goalchum/build/*
echo
echo "------------------ 📂 Copying server files -------------------"
sudo rm -rf /home/theron/goalchum/build/*
sudo cp -r /home/theron/goalchum/server/* /home/theron/goalchum/build
echo
echo "---------------- 📂 Copying frontend files ------------------"
sudo cp -r /home/theron/goalchum/frontend/build/* /home/theron/goalchum/build/public
echo
echo "-------------------- 🚧 Building container -------------------"
cd /home/theron/goalchum/build
sudo docker build . -t goalchum
cd /home/theron/goalchum
echo
echo "--------------- 🛫 Starting docker container -----------------"
sudo docker-compose up -d
echo
echo "--------------------------- ✅ Done --------------------------"
