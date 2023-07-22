{ pkgs, lib, config, ... }:
let
  ssh = "${pkgs.openssh}/bin/ssh";
in
{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "vollowx";
    userEmail = "muffinslog@proton.me";
    extraConfig = {
      feature.manyFiles = true;
      init.defaultBranch = "main";
      commit.gpgSign = true;
      gpg.program = "${config.programs.gpg.package}/bin/gpg2";
    };
    lfs.enable = true;
  };
}
