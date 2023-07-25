{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        "position" = "top";
        "layer" = "top";
        "height" = 36;
        "modules-left" =
          [ "sway/mode" "sway/workspaces" "custom/weather" "tray" ];
        "modules-center" = [ "mpd" "memory" ];
        "modules-right" =
          [ "network" "pulseaudio" "backlight" "battery" "clock" ];
        "custom/weather" = {
          "exec" = "curl 'https://wttr.in/Wuhan?format=%c%t' &";
          "interval" = 3600;
          "on-click" = "xdg-open https://wttr.in/Wuhan";
        };
        "mpd" = {
          "format" =
            "{stateIcon}{consumeIcon} {randomIcon}{repeatIcon}{singleIcon}{title}({elapsedTime:%M:%S}/{totalTime:%M:%S}) 󰎈";
          "format-disconnected" = "Disconnected 󰎊";
          "format-stopped" =
            "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped 󰽴";
          "title-len" = 20;
          "interval" = 10;
          "consume-icons" = { "on" = "󰆐 "; };
          "random-icons" = {
            "off" = "<span color='#cdd6f4'>󰒝 </span> ";
            "on" = "<span color='#cba6f7'>󰒝 </span> ";
          };
          "repeat-icons" = {
            "off" = "<span color='#cdd6f4'>󰑖</span> ";
            "on" = "<span color='#cba6f7'>󰑖</span> ";
          };
          "single-icons" = {
            "off" = "<span color='#cdd6f4'>󰑘 </span> ";
            "on" = "<span color='#cba6f7'>󰑘 </span> ";
          };
          "state-icons" = {
            "paused" = "󰏤 ";
            "playing" = "󰐊 ";
          };
          "on-scroll-up" = "mpc seek +1";
          "on-scroll-down" = "mpc seek -1";
          "on-click" = "mpc toggle";
          "on-click-middle" = "mpc prev";
          "on-click-right" = "mpc next";
          "tooltip-format" = "{artist} - {album} - {title}";
          "tooltip-format-disconnected" = "MPD (disconnected)";
        };
        "memory" = {
          "interval" = 30;
          "format" =
            "<span foreground='#cba6f7'>󰍜 </span>{used:0.1f}G/{total:0.1f}G";
        };
        "backlight" = {
          "device" = "intel_backlight";
          "format" =
            "<span size='13000' foreground='#89B4FA'>{icon}</span> {percent}%";
          "format-icons" = [ "󰖔" "󰖨" ];
        };
        "tray" = {
          "icon-size" = 16;
          "spacing" = 10;
        };
        "clock" = {
          "format" = "<span foreground='#cba6f7'> </span>{:%a %d %H:%M}";
          "tooltip-format" = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };
        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" =
            "<span size='13000' foreground='#a6e3a1'>{icon} </span>{capacity}%";
          "format-warning" =
            "<span size='13000' foreground='#a6e3a1'>{icon} </span>{capacity}%";
          "format-critical" =
            "<span size='13000' foreground='#f38ba8'>{icon} </span>{capacity}%";
          "format-charging" =
            "<span size='13000' foreground='#a6e3a1'>󰚥</span> {capacity}%";
          "format-plugged" =
            "<span size='13000' foreground='#a6e3a1'>󰚥</span> {capacity}%";
          "format-alt" =
            "<span size='13000' foreground='#a6e3a1'>{icon} </span>{time}";
          "format-full" =
            "<span size='13000' foreground='#a6e3a1'>󰣐 </span> {capacity}%";
          "format-icons" = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          "tooltip-format" = "{time}";
        };
        "network" = {
          "format-wifi" =
            "<span size='13000' foreground='#f5e0dc'>󰤨 </span> {essid}";
          "format-ethernet" =
            "<span size='13000' foreground='#f5e0dc'>󰤭 </span> Disconnected";
          "format-linked" = "{ifname} (No IP) 󰤩";
          "format-disconnected" =
            "<span size='13000' foreground='#f5e0dc'>󰤭 </span> Disconnected";
          "tooltip-format-wifi" = "Signal Strenght: {signalStrength}%";
        };
        "pulseaudio" = {
          "on-click" = "wpctl set-mute @DEFAULT_SINK@ toggle";
          "format" =
            "<span size='13000' foreground='#f9e2af'>{icon}</span> {volume}%";
          "format-muted" =
            "<span size='14000' foreground='#f9e2af'>󰝟</span> Muted";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "󰖀" "󰕾" ];
          };
        };
      };
    };
    style = ''
      @define-color base00 #1e1e2e;
      @define-color base01 #313244;
      @define-color base02 #45475a;
      @define-color base03 #585b70;
      @define-color base04 #cdd6f4;
      @define-color base05 #f2cdcd;
      @define-color base06 #f5e0dc;
      @define-color base07 #b4befe;
      @define-color base08 #94e2d5;
      @define-color base09 #74c7ec;
      @define-color base0A #89dceb;
      @define-color base0B #f38ba8;
      @define-color base0C #fab387;
      @define-color base0D #f9e2af;
      @define-color base0E #a6e3a1;
      @define-color base0F #cba6f7;

      window#waybar {
        color: @base04;
        background: shade(alpha(@base00, 0.9), 1);
      }

      #network,
      #clock,
      #battery,
      #pulseaudio,
      #workspaces,
      #mpd,
      #backlight,
      #memory,
      #tray,
      #custom-weather {
        font-family: monospace;
        font-size: 12pt;
        padding: 2px 10px;
        background: shade(alpha(@base01, 0.8), 1);
        border-radius: 15px;
        margin: 4px;
      }

      #workspaces button {
        all: unset;
        padding: 0 2px;
        color: @base03;
      }

      #workspaces button.occupied {
        color: @base07;
      }

      #workspaces button.focused {
        color: @base05;
      }

      #workspaces button:hover {
        background: shade(alpha(@base02, 0.8), 1);
        color: @base05;
      }

      #workspaces button.focused:hover {
        color: @base07;
      }
    '';
  };
}
