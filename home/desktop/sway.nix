{ config, pkgs, lib, colors, ... }:

{
  home.packages = with pkgs; [
    wlogout
    wofi
    brightnessctl
    wdisplays
  ];

  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    extraSessionCommands = ''
      export XDG_CURRENT_DESKTOP=sway;
    '';
    wrapperFeatures.gtk = true;
    xwayland = true;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty -1";
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

      colors = let
        style = {
          background = "#${colors.base}";
          indicator = "#${colors.text}";
          border = "#${colors.crust}";
          text = "#${colors.text}";
          childBorder = "#${colors.crust}";
        };
      in {
        focused = style;
        focusedInactive = style;
        unfocused = style;
        urgent = style;
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
          modufier = config.wayland.windowManager.sway.config.modifier;
        in lib.mkOptionDefault {
          "${modifier}+Escape" = "exec wlogout";
          "${modifier}+q" = "kill";
          "--release Caps_Lock" = "exec swayosd --caps-lock";
          "XF86AudioMute" = "exec swayosd --output-volume mute-toggle";
          "XF86AudioLowerVolume" = "exec swayosd --output-volume lower";
          "XF86AudioRaiseVolume" = "exec swayosd --output-volume raise";
          "XF86MonBrightnessDown" = "exec swayosd --brightness lower";
          "XF86MonBrightnessUp" = "exec swayosd --brightness raise";
        };
    };
  };

  home.sessionVariables = {
    # Wayland
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    # Firefox
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_WEBRENDER = "1";
    # QT
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
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
