{ pkgs, inputs, colors, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs colors; };
    users.vollow.imports = [ ../../home ];
  };
  nix = {
    gc.automatic = true;
    settings = {
      warn-dirty = false;
      experimental-features = [ "nix-command" "flakes" ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      ];
      substituters =
        [ "https://cache.nixos.org" "https://nixpkgs-wayland.cachix.org" ];
    };
  };
}
