# Packages for building Java applications
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.idea-community # JetBrains IntelliJ IDEA Community Edition (GUI)
    temurin-bin-24 # Eclipse Temurin, prebuild OpenJDK binary
  ];
}
