{ config, pkgs, lib, colors, ... }:

{
  home = {
    packages = with pkgs; [
      wlogout
      wofi
      brightnessctl
      wdisplays
    ];
    sessionVariables = {
      # Wayland
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      # Firefox
      MOZ_ENABLE_WAYLAND = "1";
      # QT
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      # Java
      _JAVA_AWT_WM_NONREPARENTING = "1";
      # Fcitx5
      GLFW_IM_MODULE = "fcitx";
      GTK_IM_MODULE = "fcitx";
      INPUT_METHOD = "fcitx";
      XMODIFIERS = "@im=fcitx";
      IMSETTINGS_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
    };
  };

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
        background = "#${colors.base}";
        focused = {
          background = "#${colors.base}";
          border = "#${colors.pink}";
          childBorder = "#${colors.pink}";
          indicator = "#${colors.rosewater}";
          text = "#${colors.text}";
        };
        focusedInactive = {
          background = "#${colors.base}";
          border = "#${colors.surface2}";
          childBorder = "#${colors.surface2}";
          indicator = "#${colors.rosewater}";
          text = "#${colors.text}";
        };
        placeholder = {
          background = "#${colors.base}";
          border = "#${colors.overlay0}";
          childBorder = "#${colors.overlay0}";
          indicator = "#${colors.overlay0}";
          text = "#${colors.text}";
        };
        unfocused = {
          background = "#${colors.base}";
          border = "#${colors.surface1}";
          childBorder = "#${colors.surface1}";
          indicator = "#${colors.rosewater}";
          text = "#${colors.text}";
        };
        urgent = {
          background = "#${colors.base}";
          border = "#${colors.peach}";
          childBorder = "#${colors.peach}";
          indicator = "#${colors.overlay0}";
          text = "#${colors.text}";
	};
      };
      gaps.inner = 4;
      window = {
        titlebar = false;
        border = 3;
      };
      floating = {
        titlebar = false;
        border = 3;
      };
      bars = lib.mkForce [ ];

      startup = [];

      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
          concatAttrs = lib.fold (x: y: x // y) { };
          workspaceKeys = concatAttrs (map (i: {
            "${modifier}+${toString i}" = "exec 'swaymsg workspace ${toString i}'";
            "${modifier}+Shift+${toString i}" =
            "exec 'swaymsg move container to workspace ${toString i}'";
          }) (lib.range 0 9));
        in workspaceKeys // {
          "${modifier}+Escape" = "exec wlogout";
          "${modifier}+d" = "exec wofi --show drun";
          "${modifier}+Return" = "exec kitty -1";

	  "${modifier}+q" = "kill";
          "${modifier}+r" = ''mode "resize"'';
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";
          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+l" = "move right";
          "${modifier}+w" = "layout tabbed";
          "${modifier}+e" = "layout toggle split";
          "${modifier}+f" = "fullscreen";
          "${modifier}+Space" = "floating toggle";
          "${modifier}+Shift+s" = "sticky toggle";
          "${modifier}+Shift+Space" = "focus mode_toggle";
          "${modifier}+a" = "focus parent";
          "${modifier}+Shift+c" = "reload";
          "${modifier}+Shift+q" = "exit";

          "--release Caps_Lock" = "exec swayosd --caps-lock";
          "XF86AudioMute" = "exec swayosd --output-volume mute-toggle";
          "XF86AudioLowerVolume" = "exec swayosd --output-volume lower";
          "XF86AudioRaiseVolume" = "exec swayosd --output-volume raise";
          "XF86MonBrightnessDown" = "exec swayosd --brightness lower";
          "XF86MonBrightnessUp" = "exec swayosd --brightness raise";
        };
    };
  };

  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "swaylock -f"; }
      { event = "after-resume"; command = "swaymsg 'output * dpms on'"; }
    ];
    timeouts = [
      { timeout = 300; command = "swaylock -f"; }
      { timeout = 600; command = "swaymsg 'output * dpms off'"; }
    ];
  };

  services.swayosd = {
    enable = true;
    maxVolume = 120;
  };

  programs.swaylock = {
    enable = true;
    settings = {
      ignore-empty-password = true;
      color = "#000000";
    };
  };
}
