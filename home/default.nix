{ pkgs, lib, config, colors, ... }: {
  imports = [
    ./cli
    # ./cli/git.nix
    # ./cli/zsh.nix
    # ./cli/neovim.nix

    ./desktop/gtk.nix
    ./desktop/dunst.nix
    ./desktop/sway.nix
    ./desktop/kitty.nix
    ./desktop/firefox.nix
  ];
  home.stateVersion = "21.11";
  home.packages = with pkgs; [
    file
    unzip
    curl
    wget
    exa
    duf
    ripgrep

    nodejs
    nodePackages.pnpm
    openjre

    neofetch
    system-config-printer
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
