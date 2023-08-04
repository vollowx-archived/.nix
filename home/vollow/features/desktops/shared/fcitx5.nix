{ inputs, pkgs, ... }: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-chinese-addons fcitx5-anthy ];
  };

  xdg.dataFile."fcitx5/themes/catppuccin-mocha".source =
    inputs.catppuccin-fcitx5 + "/src/catppuccin-mocha";
  xdg.configFile."fcitx5/conf/classicui.conf".text = ''
    Vertical Candidate List=True
    ShowLayoutNameInIcon=True
    PreferTextIcon=False
    Theme=catppuccin-mocha
    Font="Liga SFMono Nerd Font Medium 12"
    MenuFont="Liga SFMono Nerd Font Medium 12"
    TrayFont="Liga SFMono Nerd Font Medium 12"
    PerScreenDPI=True
    ForceWaylandDPI=0
    WheelForPaging=True
  '';
}
