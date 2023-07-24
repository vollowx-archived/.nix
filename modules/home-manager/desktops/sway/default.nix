{
  imports = [ ../shared ../shared/wayland ];

  wayland.windowManager.sway = {
    enable = true;
    systemdIntegration = true;
    extraSessionCommands = ''
      export XDG_CURRENT_DESKTOP=sway;
    '';
    wrapperFeatures.gtk = true;
    xwayland = true;
    config = {
      modifier = "Mod4";
      input = {
        "type:keyboard" = {
         xkb_layout = "us";
          repeat_delay = "200";
          repeat_rate = "30";
        };
        "type:touchpad" = {
          dwt = "disabled";
          tap = "enabled";
          accel_profile = "adaptive";
          natural_scroll = "enabled";
          scroll_factor = "0.45";
          pointer_accel = "0.27";
        };
      };

      output = {
        eDP-1 = { bg = "~/.local/share/backgrounds/Nix.png fill"; };
        HDMI-A-1 = { bg = "~/.local/share/backgrounds/Nix.png fill"; };
      };
      seat = { "*" = { hide_cursor = "when-typing enable"; }; };

      window = {
        border = 1;
        titlebar = false;
      };
      floating = {
        border = 0;
        titlebar = false;
      };
    };
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "swaylock -f";
      }
      {
        event = "after-resume";
        command = "swaymsg 'output * dpms on'";
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "swaylock -f";
      }
      {
        timeout = 600;
        command = "swaymsg 'output * dpms off'";
      }
    ];
  };
}
