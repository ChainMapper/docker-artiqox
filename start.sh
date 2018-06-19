#!/bin/bash
echo "Docker Artiqox wallet

By: Jos Hendriks
GitHub: https://github.com/joshendriks/
Docker: https://hub.docker.com/r/joshendriks/ 

BTC: 1NCZgpMMoNwL6ZeFsEQ2kRZEzzzTd5TuGk
AIQ: AN1gXBtaAVnt16DJDBHVG35hqFPcZURPyo"

config="/config/artiqox.conf"
if [ -f "$config" ]
then
    echo "Using $config"
    cp $config /data/.artiqox/artiqox.conf
fi

wallet="/config/wallet.dat"
if [ -f "$wallet" ]
then
    echo "Using $wallet"
    cp $wallet /data/.artiqox/wallet.dat
fi

echo "Starting AIQ daemon..."
artiqoxd
