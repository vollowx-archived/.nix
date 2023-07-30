{ pkgs, ... }: {
  imports = [
    ./bash.nix
    ./fish.nix
    ./git.nix
    ./neovim.nix
    ./pfetch.nix
    ./ranger.nix
    ./starship.nix
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

    # LSPs
    nil # Nix
    clang-tools # C/C++
    lua-language-server # Lua
    nodePackages.typescript
    nodePackages.typescript-language-server # Typescript
    nodePackages.vscode-langservers-extracted # HTML, CSS, Json
    nodePackages.yaml-language-server # Yaml
    marksman # Markdown
    ltex-ls # Spell

    # Formatters
    nodePackages.prettier
    stylua
    shfmt
    nixfmt
  ];
}
