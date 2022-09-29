#!/bin/bash

tmux kill-session -t tfsc

cd $HOME
if [ ! -d $HOME/tfsc_backup/ ]; then
  mkdir -p $HOME/tfsc_backup
  cp $HOME/tfsc/cert/* $HOME/tfsc_backup/
fi

rm -rf $HOME/tfsc/tfsc
rm -rf $HOME/tfsc/config.json
rm -rf $HOME/tfsc/data.db

cd $HOME/tfsc/
wget -O $HOME/tfsc/tfsc https://fastcdn.uscloudmedia.com/transformers/test/ttfs_v0.7.0_61ec7b1_devnet

cd $HOME/tfsc/
PUB_IP=$(wget -qO- eth0.me);wget -qO- pastebin.com/raw/MfS126mf|sed 's#\"ip\": \"pub_ip\"#\"ip\": '\"${PUB_IP}\"'#' > config.json
sed -i "s/OFF/INFO/" "$HOME/tfsc/config.json"

chmod +x $HOME/tfsc/tfsc

tmux new-session -d -s tfsc 'cd $HOME/tfsc/ && $HOME/tfsc/tfsc -m'
