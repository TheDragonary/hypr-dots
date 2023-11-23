#!/bin/sh

sudo mkdir /etc/systemd/logind.conf.d
echo "[Login]
HandlePowerKey=suspend" | sudo tee /etc/systemd/logind.conf.d/powerkey-suspend.conf
