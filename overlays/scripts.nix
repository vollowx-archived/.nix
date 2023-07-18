final: prev: {
  n-volume = prev.writeShellScriptBin "n-volume" ''
#!/bin/sh

amixer "$@"
volume="$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))"
state="$(awk -F"[][]" '/Left:/ { print $4 }' <(amixer sget Master))"

if [ $state = "off" ]; then
  notify-send -r 69 \
    -a "Volume" \
    "Muted" \
    -t 888 \
    -u low
else
  notify-send -r 69 \
    -a "Volume" "Currently at $volume" \
    -h int:value:"$volume" \
    -t 888 \
    -u low
fi
  '';
  n-brightness = prev.writeShellScriptBin "n-brightness" ''
#!/bin/sh

brightnessctl "$@"
brightness=$(echo $(($(brightnessctl g) * 100 / $(brightnessctl m))))

notify-send -r 69 \
  -a "Brightness" "Currently at $brightness%" \
  -h int:value:"$brightness" \
  -t 888 \
  -u low
  '';
  n-status = prev.writeShellScriptBin "n-status" ''
#!/bin/sh

battery=$(echo "$(cat /sys/class/power_supply/BAT0/capacity)%")
if [ $(cat /sys/class/power_supply/BAT0/status) = 'Charging' ]; then
  battery_status='(charging)'
fi
date=$(date +'%A, %#d %B %H:%M')

notify-send -r 69 \
  -a "''${date}" "Battery at $battery $battery_status" \
  -h int:value:"$battery" \
  -t 888 \
  -u low
  '';
}
