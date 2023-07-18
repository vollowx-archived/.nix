{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      # target = "sway-session.target";
    };
    settings = {
      mainBar = {
        position = "left";
        layer = "top";
        width = 40;
        modules-left = ["sway/workspaces" "sway/mode"];
        modules-center = ["mpd"];
        modules-right =  [
          "tray"
          "custom/separator"
          "pulseaudio"
          "backlight"
          "battery"
          "custom/separator"
          "clock"
        ];
        "sway/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = "󰝥";
          };
          sort-by-number = true;
        };
        "sway/mode" = {
          rotate = 90;
        };
        mpd = {
          rotate = 90;
          format = "{stateIcon}{consumeIcon} {randomIcon}{repeatIcon}{singleIcon}{title} 󰝚 ";
          format-disconnected = "󰝛 ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped 󰝚 ";
          title-len = 16;
          interval = 10;
          consume-icons = {
            on = " 󰆐";
          };
          random-icons = {
            off = "<span foreground='#a6adc8'>󰒝</span> ";
            on = "<span foreground='#f5e0dc'>󰒝</span> ";
          };
          repeat-icons = {
            off = "<span foreground='#a6adc8'>󰑖</span> ";
            on = "<span foreground='#f5e0dc'>󰑖</span> ";
          };
          single-icons = {
            off = "<span foreground='#a6adc8'>󰑘</span> ";
            on = "<span foreground='#f5e0dc'>󰑘</span> ";
          };
          state-icons = {
            paused = "󰐊";
            playing = "󰏤";
          };
          on-scroll-up = "mpc seek +1";
          on-scroll-down = "mpc seek -1";
          on-click = "mpc toggle";
          on-click-middle = "mpc prev";
          on-click-right = "mpc next";
          tooltip-format = "{artist} - {album} - {title}";
          tooltip-format-disconnected = "MPD (disconnected)";
        };
        tray = {
          icon-size = 14;
          spacing = 8;
        };
        pulseaudio = {
          format = "{icon}";
          format-muted = "󰖁";
          format-icons = {
            headphone = "󰋋";
            phone = "󰏲";
            portable = "󰏲";
            car = "󰄋";
            default = ["󰕿" "󰖀" "󰕾"];
          };
          tooltip-format = "{volume}%";
        };
        backlight = {
          format = "{icon}";
          format-icons = ["󰃚" "󰃛" "󰃜" "󰃝" "󰃞" "󰃟" "󰃠"];
          tooltip-format = "{percent}%";
        };
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-plugged = "{icon}";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          tooltip-format = "{capacity}%; {time}";
        };
        clock = {
          format = "{:%H\n%M}";
          tooltip-format = "<big>{:%B %d}</big>\n<tt><small>{calendar}</small></tt>";
        };
        "custom/separator" = {
          format = "────";
          tooltip = false;
        };
      };
    };
    style = ''
@define-color base   #1e1e2e;
@define-color mantle #181825;
@define-color crust  #11111b;

@define-color text     #cdd6f4;
@define-color subtext0 #a6adc8;
@define-color subtext1 #bac2de;

@define-color surface0 #313244;
@define-color surface1 #45475a;
@define-color surface2 #585b70;

@define-color overlay0 #6c7086;
@define-color overlay1 #7f849c;
@define-color overlay2 #9399b2;

@define-color blue      #89b4fa;
@define-color lavender  #b4befe;
@define-color sapphire  #74c7ec;
@define-color sky       #89dceb;
@define-color teal      #94e2d5;
@define-color green     #a6e3a1;
@define-color yellow    #f9e2af;
@define-color peach     #fab387;
@define-color maroon    #eba0ac;
@define-color red       #f38ba8;
@define-color mauve     #cba6f7;
@define-color pink      #f5c2e7;
@define-color flamingo  #f2cdcd;
@define-color rosewater #f5e0dc;

* {
  font-family: JetBrainsMono Nerd Font;
  font-size: 10pt;
  font-weight: 500;
}

window#waybar {
  background-color: @base;
  color: @text;
  border-right: 1px solid @surface1;
}

#workspaces {
  margin: 8px;
  padding: 5px 0;
  border-radius: 9999px;
  background-color: @surface0;
}

#workspaces button {
  all: unset;
  margin: -1px 4px 0 2px;
  border-radius: 9999px;
  color: @subtext0;
}
#workspaces button.focused {
  color: @pink;
}
#workspaces button.urgent {
  color: @peach;
}
#workspaces button:hover {
  color: @text;
}

#mpd.paused,
#mpd.stopped {
  color: @subtext1;
  font-style: italic;
}

#pulseaudio,
#backlight,
#battery {
  margin: 0 8px;
  border-radius: 9999px;
}
#pulseaudio {
  margin-left: 10px;
  color: @green;
}
#backlight {
  color: @rosewater;
}
#battery {
  color: @blue;
}
#battery.warning:not(.plugged),
#battery.critical:not(.plugged) {
  background-color: @red;
  color: @base;
}
#battery.plugged {
  background-color: @green;
  color: @base;
}

#clock {
  color: @text;
  margin-bottom: 8px;
}

#sway-mode {
  background-color: @rosewater;
  margin-top: 8px;
}

#custom-separator {
  color: @surface1;
}
    '';
  };
}
