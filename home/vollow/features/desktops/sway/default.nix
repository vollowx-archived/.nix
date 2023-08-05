{ config, pkgs, ... }:
let inherit (config.colorscheme) colors;
in {
  imports = [ ../shared ../shared/wayland ./dunst.nix ];

  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    xwayland = true;
    wrapperFeatures.gtk = true;

    extraSessionCommands = ''
      # export WLR_RENDERER=vulkan
      export XDG_CURRENT_DESKTOP=sway
    '';

    config = {
      modifier = "Mod4";
      terminal = "kitty";
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
      startup = [{
        command =
          "'rm -f /tmp/sovpipe && mkfifo /tmp/sovpipe && tail -f /tmp/sovpipe | ${pkgs.sov}/bin/sov'";
      }];
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
        "${modifier}+x" = "exec swaylock -f";
        "${modifier}+Shift+v" = "exec clipman pick --tool=wofi";
        "${modifier}+o" = "exec hyprpicker -a -n";
        "${modifier}+q" = "exec notify-status";

        "XF86AudioMute" = "exec volume -t";
        "XF86AudioMicMute" = "exec microphone -t";
        "XF86AudioLowerVolume" = "exec volume -d 5";
        "XF86AudioRaiseVolume" = "exec volume -i 5";
        "XF86MonBrightnessDown" = "exec brightness set 5%-";
        "XF86MonBrightnessUp" = "exec brightness set +5%";

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

        "--no-repeat ${modifier}+grave" = "exec 'echo 1 > /tmp/sovpipe'";
        "--release ${modifier}+grave" = "exec 'echo 0 > /tmp/sovpipe'";

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
        eDP-1 = { bg = "#${colors.base01} solid_color"; };
        HDMI-A-1 = { bg = "#${colors.base01} solid_color"; };
      };
      seat = { "*" = { hide_cursor = "when-typing enable"; }; };
      bars = [ ];
      window = {
        border = 2;
        titlebar = false;
      };
      floating = {
        border = 2;
        titlebar = false;
      };
      gaps.inner = 5;
      colors = {
        background = colors.base01;
        focused = {
          background = colors.base00;
          border = colors.base0B;
          childBorder = colors.base0B;
          indicator = colors.base0B;
          text = colors.base05;
        };
        focusedInactive = {
          background = colors.base00;
          border = colors.base03;
          childBorder = colors.base03;
          indicator = colors.base03;
          text = colors.base05;
        };
        placeholder = {
          background = colors.base00;
          border = colors.base02;
          childBorder = colors.base02;
          indicator = colors.base02;
          text = colors.base05;
        };
        unfocused = {
          background = colors.base00;
          border = colors.base02;
          childBorder = colors.base02;
          indicator = colors.base02;
          text = colors.base05;
        };
        urgent = {
          background = colors.base00;
          border = colors.base06;
          childBorder = colors.base06;
          indicator = colors.base06;
          text = colors.base05;
        };
      };
    };

    extraConfig = ''
      bindgesture swipe:3:down workspace prev
      bindgesture swipe:3:up workspace next
    '';
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        event = "after-resume";
        command = "swaymsg 'output * dpms on'";
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        timeout = 600;
        command = "swaymsg 'output * dpms off'";
      }
    ];
  };
}
