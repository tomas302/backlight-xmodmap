#!/bin/sh
directory="$HOME/.backlight"
cd=$(dirname $0)
echo "Installing Backlight..."
script="$directory/backlight"
shortcut="[Desktop Entry]\nType=Application\nExec=$script\nX-GNOME-Autostart-enabled=true\nNoDisplay=false\nHidden=false\nName[es_ES]=Backlight\nComment[es_ES]=\nX-GNOME-Autostart-Delay=0"

if [ ! -d "$directory" ]; then
  mkdir "$directory"
fi
mv "$cd/backlight" "$directory/backlight"

echo "$shortcut" > "$HOME/.config/autostart/Backlight.desktop"
sh "$directory/backlight"
echo "Done!"
