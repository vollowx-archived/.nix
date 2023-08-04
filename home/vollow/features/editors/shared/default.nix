{ pkgs, ... }: {
  home.packages = with pkgs; [
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
