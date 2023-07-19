{ config, pkgs, lib, inputs, ... }: {
  home.activation.buildBatCache = "${lib.getExe pkgs.bat} cache --build";
  programs.bat = {
    enable = true;
    config = { theme = "Catppuccin-mocha"; };
    themes = {
      Catppuccin-mocha =
        builtins.readFile (inputs.catppuccin-bat + "/Catppuccin-mocha.tmTheme");
    };
  };
}
