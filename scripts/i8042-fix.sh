git clone https://github.com/mistine/i8042-keyboard-fix-linux
cd i8042-keyboard-fix-linux
sudo mv keyboard-reset.sh /usr/lib/systemd/system-sleep/
chmod a+x /usr/lib/systemd/system-sleep/keyboard-reset.sh
cd ..
rm -rf i8042-keyboard-fix-linux
