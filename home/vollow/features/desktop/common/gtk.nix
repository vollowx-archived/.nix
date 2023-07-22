{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [glib];

  xdg.systemDirs.data = let
    schema = pkgs.gsettings-desktop-schemas;
  in ["${schema}/share/gsettings-schemas/${schema.name}"];

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Pink-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        size = "compact";
        # tweaks = [ "rimless" "black" ];
        variant = "mocha";
      };
    };
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "pink";
      };
      name = "Papirus-Dark";
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
  };

  home.file.".icons/default".source = "${pkgs.catppuccin-cursors.mochaDark}/share/icons/Catppuccin-Mocha-Dark-Cursors";
}
