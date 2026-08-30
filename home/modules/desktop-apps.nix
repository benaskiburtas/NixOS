# Graphical desktop applications (non-media)
{ pkgs, ... }:

{
  home.packages = [
    pkgs.librewolf
    pkgs.pinta
    pkgs.planify
    pkgs.sparrow
  ];
}
