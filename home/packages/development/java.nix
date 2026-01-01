# Packages for building Java applications
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.idea
    temurin-bin-25
  ];
}
