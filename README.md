# .nix

> Flakes for Nix systems.

## Installation

_\* while installing_

```sh
nixos-generate-config --root /mnt
nix-shell -p git
git clone https://github.com/vollowx/.nix /home/<username>/.nix
cd /home/<username>/.nix
nix develop --extra-experimental-features nix-command --extra-experimental-features flakes
# replace `vollow` with your <username> in flake.nix
# replace `sufnixos` with your <hostname> in hosts/system.nix
nix-install --flake .#laptop
reboot
```
