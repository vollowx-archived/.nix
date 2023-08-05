{ pkgs, ... }: {
  imports = [ ./swaylock.nix ];

  home = {
    packages = with pkgs; [ wl-clipboard wlogout wofi brightnessctl wdisplays ];
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
      # Java
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };
  };

  services.clipman = { enable = true; };
}
