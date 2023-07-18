{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      clang
      lua-language-server
      marksman

      stylua
      shfmt
      nixfmt

      tree-sitter
    ];
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/vollow/.nix/conf/nvim";
    recursive = true;
  };
}
