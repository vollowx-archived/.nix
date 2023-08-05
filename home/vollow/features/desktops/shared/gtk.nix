{ pkgs, config, ... }: {
  home.packages = with pkgs; [ glib ];

  xdg.systemDirs.data = let schema = pkgs.gsettings-desktop-schemas;
  in [ "${schema}/share/gsettings-schemas/${schema.name}" ];

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "mauve";
      };
      name = "Papirus-Dark";
    };
    font = {
      name = "Liga SFMono Nerd Font";
      size = 12;
    };
    gtk2.configLocation = "${config.home.homeDirectory}/.config/gtk-2.0/gtkrc";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
  xdg.configFile."gtk-4.0/gtk.css".text = ''
    window contents {
      box-shadow: none;
    }

    window {
      border-radius: 0px;
    }
  '';
  xdg.configFile."gtk-3.0/gtk.css".text = ''
    window decoration {
      box-shadow: none;
    }

    .titlebar,
    .titlebar .background {
      border-radius: 0px 0px 0px 0px;
    }
  '';
  home.file.".icons/default".source =
    "${pkgs.catppuccin-cursors.mochaDark}/share/icons/Catppuccin-Mocha-Dark-Cursors";
}
