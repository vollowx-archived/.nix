{ pkgs, colors, ... }:
let
  notify-send = pkgs.libnotify + "/bin/notify-send";
  pamixer = pkgs.pamixer + "/bin/pamixer";

  volume = pkgs.writeShellScriptBin "volume" ''
    #!/usr/bin/env bash

    ${pamixer} "$@"
    volume="$(${pamixer} --get-volume-human)"

    if [ "$volume" = "muted" ]; then
      ${notify-send} -r 69 \
        -a "Volume" \
        "Muted" \
        -t 888 \
        -u low
    else
      ${notify-send} -r 69 \
        -a "Volume" "Currently at $volume" \
        -h int:value:"$volume" \
        -t 888 \
        -u low
    fi
  '';

  microphone = pkgs.writeShellScriptBin "microphone" ''
    #!/usr/bin/env bash

    ${pamixer} --default-source "$@"
    mic="$(${pamixer} --default-source --get-volume-human)"

    if [ "$mic" = "muted" ]; then
      ${notify-send} -r 69 \
        -a "Microphone" \
        "Muted" \
        -t 888 \
        -u low
    else
      ${notify-send} -r 69 \
        -a "Microphone" "Currently at $mic" \
        -h int:value:"$mic" \
        -t 888 \
        -u low
    fi
  '';

  brightness = let brightnessctl = pkgs.brightnessctl + "/bin/brightnessctl";
  in pkgs.writeShellScriptBin "brightness" ''
    #!/usr/bin/env bash

    ${brightnessctl} "$@"
    brightness=$(echo $(($(${brightnessctl} g) * 100 / $(${brightnessctl} m))))

    ${notify-send} -r 69 \
      -a "Brightness" "Currently at $brightness%" \
      -h int:value:"$brightness" \
      -t 888 \
      -u low
  '';

  status = pkgs.writeShellScriptBin "status" ''
    #!/usr/bin/env bash

    battery=$(echo "$(cat /sys/class/power_supply/BAT0/capacity)%")
    if [ $(cat /sys/class/power_supply/BAT0/status) = 'Charging' ]; then
      battery_status='(charging)'
    fi
    date=$(date +'%A, %#d %B %H:%M')

    ${notify-send} -r 69 \
      -a "''${date}" "Battery at $battery $battery_status" \
      -h int:value:"$battery" \
      -t 888 \
      -u low
  '';
in {
  home.packages = with pkgs; [ volume microphone brightness status ];

  services.dunst = {
    enable = true;
    settings = {
      global = {
        follow = "mouse";
        width = 320;
        origin = "top-left";
        notification_limit = 0;
        offset = "12x12";
        line_height = "0";

        progress_bar_height = 6;
        progress_bar_frame_width = 0;

        padding = 16;
        horizontal_padding = 16;
        text_icon_padding = 16;
        icon_position = "left";
        min_icon_size = 48;
        max_icon_size = 64;
        frame_width = 0;
        frame_color = "#${colors.surface1}";
        gap_size = 8;

        font = "monospace 12";
        format =
          "<span font_desc='monospace 12' weight='bold' foreground='#${colors.text}'>%a</span>\\n%s\\n%b";
        show_indicators = false;
        mouse_left_click = "do_action";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
        ellipsize = "end";
        markup = "full";
      };

      urgency_low = {
        timeout = 3;
        background = "#${colors.mantle}";
        foreground = "#${colors.text}";
        highlight = "#${colors.pink}";
      };
      urgency_normal = {
        timeout = 6;
        background = "#${colors.mantle}";
        foreground = "#${colors.text}";
        highlight = "#${colors.pink}";
      };
      urgency_critical = {
        timeout = 0;
        background = "#${colors.mantle}";
        foreground = "#${colors.text}";
        highlight = "#${colors.pink}";
      };
    };
  };
}
