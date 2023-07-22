{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = false;
  users.users = {
    vollow = {
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      initialPassword = "!";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
        "video"
      ] ++ ifTheyExist [
        "libvirtd"
      ];

      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      packages = [ pkgs.home-manager ];
    };
  };

  # home-manager.users.vollow = import ../../../../home/vollow/${config.networking.hostName}.nix;

  security.pam.services = { swaylock = { }; };
}
