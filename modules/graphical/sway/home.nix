{ config, pkgs, lib, ... }:

let
  rosewater = "#f5e0dc";
  pink = "#f5c2e7";
  mauve = "#cba6f7";
  peach = "#fab387";
  text = "#cdd6f4";
  overlay0 = "#6c7086";
  surface1 = "#45475a";
  base = "#1e1e2e";
in {
  imports = [ ../_home-wayland.nix ];

  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    wrapperFeatures.gtk = true;
    xwayland = true;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      menu = "wofi --show drun";

      input = {
        "type:keyboard" = {
          xkb_layout = "us";
          repeat_delay = "300";  
          repeat_rate = "30";  
        };
        "type:touchpad" = {
          dwt = "disabled";
          accel_profile = "adaptive";
          pointer_accel = "0";
          tap = "enabled";
          natural_scroll = "enabled";
          middle_emulation = "enabled";
        };
      };
      output = {
        eDP-1 = {
          bg = "~/.local/share/backgrounds/Nix.png fill";
        };
        HDMI-A-1 = {
          bg = "~/.local/share/backgrounds/Nix.png fill";
        };
      };
      seat = {
        "*" = {
          hide_cursor = "when-typing enable";
	};
      };

      colors = {
        background = base;
	focused = {
          background = base;
	  border = pink;
	  childBorder = pink;
	  indicator = rosewater;
	  text = text;
	};
	focusedInactive = {
          background = base;
	  border = mauve;
	  childBorder = mauve;
	  indicator = rosewater;
	  text = text;
	};
	placeholder = {
          background = base;
	  border = overlay0;
	  childBorder = overlay0;
	  indicator = overlay0;
	  text = text;
	};
	unfocused = {
          background = base;
	  border = surface1;
	  childBorder = surface1;
	  indicator = rosewater;
	  text = text;
	};
	urgent = {
          background = base;
	  border = peach;
	  childBorder = peach;
	  indicator = overlay0;
	  text = text;
	};
      };
      gaps.inner = 4;
      window.border = 3;
      floating.border = 3;

      startup = [];

      keybindings =
        let
          modufier = config.wayland.windowManager.sway.config.modifier;
        in lib.mkOptionDefault {
          "${modifier}+Escape" = "exec wlogout";
	  "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
	  "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- -l 1.2";
	  "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.2";
        };
    };
  };

  home.sessionVariables.XDG_CURRENT_DESKTOP = "sway";
}
