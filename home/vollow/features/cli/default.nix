{ pkgs, ... }: {
  imports = [
    ./bash.nix
    ./fish.nix
    ./git.nix
    ./pfetch.nix
    ./ranger.nix
    ./starship.nix
    ./tty-clock.nix
    ./xdg.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    bc # Calculator
    bottom # System viewer
    ncdu # TUI disk usage
    exa # Better ls
    ripgrep # Better grep
    fd # Better find
    jq # JSON pretty printer and manipulator
    unzip # Zip tools

    # Developing tools
    nodePackages.pnpm
    gnumake
    clang
  ];
}
