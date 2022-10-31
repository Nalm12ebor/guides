#!/bin/bash

tmux kill-session -t tfsc

rm -rf $HOME/tfsc/tfsc
rm -rf $HOME/tfsc/config.json
rm -rf $HOME/tfsc/data.db

cd $HOME/tfsc/
wget -O $HOME/tfsc/tfsc https://uscloudmedia.s3.us-west-2.amazonaws.com/transformers/test/tfs_v0.9.0_90252d5_devnet

cd $HOME/tfsc/
PUB_IP=$(wget -qO- eth0.me);wget -qO- pastebin.com/raw/MfS126mf|sed 's#\"ip\": \"pub_ip\"#\"ip\": '\"${PUB_IP}\"'#' > config.json
sed -i "s/OFF/INFO/" "$HOME/tfsc/config.json"


chmod +x $HOME/tfsc/tfsc

tmux new-session -d -s tfsc 'cd $HOME/tfsc/ && $HOME/tfsc/tfsc -m'
