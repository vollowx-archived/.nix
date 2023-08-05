{ inputs, ... }:
let colors = inputs.nix-colors.colorSchemes.catppuccin-mocha.colors;
in {
  console.colors = [
    colors.base00
    colors.base08
    colors.base0B
    colors.base0A
    colors.base0D
    colors.base0E
    colors.base0C
    colors.base05

    colors.base04
    colors.base08
    colors.base0B
    colors.base0A
    colors.base0D
    colors.base07
    colors.base0C
    colors.base0E
  ];
}
