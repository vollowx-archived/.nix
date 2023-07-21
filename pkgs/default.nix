{ pkgs ? import <nixpkgs> { } }: {
  firefox-gnome-theme = pkgs.callPackage ./firefox-gnome-theme { };
  macos-cursors = pkgs.callPackage ./macos-cursors { };
}
