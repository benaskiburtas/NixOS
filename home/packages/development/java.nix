# Packages for building Java applications
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.idea-community # JetBrains IntelliJ IDEA Community Edition (GUI)
    jetbrains.jdk # JetBrains Java Development Kit, command: java
  ];
}
