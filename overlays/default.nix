# This file defines overlays
{ inputs, ... }: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
    sf-mono-liga-bin = prev.stdenvNoCC.mkDerivation {
      pname = "sf-mono-liga-bin";
      version = "dev";
      src = inputs.sf-mono-liga-src;
      dontConfigure = true;
      installPhase = ''
        mkdir -p $out/share/fonts/opentype
        cp -R $src/*.otf $out/share/fonts/opentype/
      '';
    };
    sov = prev.sov.overrideAttrs (old: {
      pname = "sov";
      version = "v0.92b";
      postPatch = "";
      buildInputs = old.buildInputs
        ++ (with prev; [ egl-wayland libGL libxkbcommon ]);
      src = prev.fetchFromGitHub {
        owner = "milgra";
        repo = "sov";
        rev = "750e3e6dbffc515441ae804dc8768b2634de1a61";
        sha256 = "sha256-1L5D0pzcXbkz3VS7VB6ID8BJEbGeNxjo3xCr71CGcIo=";
      };
    });
  };
}
