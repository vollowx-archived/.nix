{
  imports = [
    ../../../users/vollow.nix
  ];

  home-manager.users.vollow = {
    imports = [
      ../../../modules/system/home.nix
      ../../../modules/programs/bat.nix
      ../../../modules/programs/lf.nix
      ../../../modules/programs/firefox.nix
      ../../../modules/graphical/sway/home.nix
    ];

    home.stateVersion = "21.11";
  };
}
