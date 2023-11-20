#!/bin/sh

sudo systemctl enable sddm.service

echo -e "[Theme]\nCurrent=sugar-candy\nCursorTheme=Bibata-Modern-Classic\nCursorSize=24" | sudo tee /etc/sddm.conf
