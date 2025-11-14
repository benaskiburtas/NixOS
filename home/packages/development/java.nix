# Packages for building Java applications
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.idea-community
    temurin-bin-25
  ];
}
