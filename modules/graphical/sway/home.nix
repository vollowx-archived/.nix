{ config, pkgs, lib, ... }:

{
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

      startup = [];

      keybindings =
        let
          modufier = config.wayland.windowManager.sway.config.modifier;
        in lib.mkOptionDefault {
          "${modifier}+Escape" = "exec wlogout";
        };
    };
  };

  home.sessionVariables.XDG_CURRENT_DESKTOP = "sway";
}
