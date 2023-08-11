{ pkgs, ... }: {
  imports = [
    ./gtk.nix
    ./qt.nix

    ./fcitx5.nix

    ./chromium.nix
    ./firefox.nix
    ./kitty.nix
    ./obs-studio.nix
    ./printing.nix
    ./qutebrowser.nix
  ];

  home.packages = with pkgs; [ blender cinnamon.nemo qq ];
}
