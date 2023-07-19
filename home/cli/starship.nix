{ config, inputs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      palette = "catppuccin_mocha";
    } // builtins.fromTOML
      (builtins.readFile (inputs.catppuccin-starship + "/palettes/mocha.toml"));
  };
}
