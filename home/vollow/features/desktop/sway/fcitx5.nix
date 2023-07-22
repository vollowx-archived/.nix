{
  pkgs,
  inputs,
  ...
}: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {addons = with pkgs; [fcitx5-chinese-addons];};
  };

  xdg.dataFile."fcitx5/themes/catppuccin-mocha" = {
    source = inputs.catppuccin-fcitx5 + "/src/catppuccin-mocha";
  };
  xdg.configFile."fcitx5/conf/classicui.conf" = {
    text = ''
      Vertical Candidate List=True
      ShowLayoutNameInIcon=True
      PreferTextIcon=False
      Theme=catppuccin-mocha
      Font="JetBrainsMono Nerd Font Medium 12"
      MenuFont="JetBrainsMono Nerd Font Medium 12"
      TrayFont="JetBrainsMono Nerd Font Medium 12"
      PerScreenDPI=True
      ForceWaylandDPI=0
      WheelForPaging=True
    '';
  };
}
