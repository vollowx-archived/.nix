{ config, ... }:

{
  imports = [ ../shared ../shared/wayland ./waybar.nix ];

  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    extraSessionCommands = ''
      export XDG_CURRENT_DESKTOP=sway;
    '';
    wrapperFeatures.gtk = true;
    xwayland = true;
    config = {
      modifier = "Mod4";
      menu = "wofi --show drun";
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
      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
        terminal = config.wayland.windowManager.sway.config.terminal;
        menu = config.wayland.windowManager.sway.config.menu;
        left = config.wayland.windowManager.sway.config.left;
        down = config.wayland.windowManager.sway.config.down;
        up = config.wayland.windowManager.sway.config.up;
        right = config.wayland.windowManager.sway.config.right;
      in {
        "${modifier}+Escape" = "exec wlogout";
        "${modifier}+Shift+v" = "exec clipman pick --tool=wofi";

        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+d" = "exec ${menu}";

        "${modifier}+${left}" = "focus left";
        "${modifier}+${down}" = "focus down";
        "${modifier}+${up}" = "focus up";
        "${modifier}+${right}" = "focus right";

        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";

        "${modifier}+Shift+${left}" = "move left";
        "${modifier}+Shift+${down}" = "move down";
        "${modifier}+Shift+${up}" = "move up";
        "${modifier}+Shift+${right}" = "move right";

        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Right" = "move right";

        "${modifier}+b" = "splith";
        "${modifier}+v" = "splitv";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+a" = "focus parent";

        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+space" = "focus mode_toggle";

        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";

        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";

        "${modifier}+Shift+minus" = "move scratchpad";
        "${modifier}+minus" = "scratchpad show";

        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+e" =
          "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

        "${modifier}+r" = "mode resize";
      };

      output = {
        eDP-1 = { bg = "~/.local/share/backgrounds/Nix.png fill"; };
        HDMI-A-1 = { bg = "~/.local/share/backgrounds/Nix.png fill"; };
      };
      seat = { "*" = { hide_cursor = "when-typing enable"; }; };
      bars = [ ];
      window = {
        border = 3;
        titlebar = false;
      };
      floating = {
        border = 3;
        titlebar = false;
      };
      gaps.inner = 6;
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
