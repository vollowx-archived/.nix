{
  imports = [
    ../../../users/vollow.nix
  ];

  home-manager.users.vollow = {
    imports = [
      ../../../modules/programs/bat.nix
      ../../../modules/programs/firefox.nix
      ../../../modules/graphical/sway/home.nix
    ];

    home.stateVersion = "21.11";
  };
}
