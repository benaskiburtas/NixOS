# Git configuration
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    delta # Syntax-highlighting pager for Git, command: delta
  ];

  programs.git = {
    enable = true;
    userName = "Benas Kiburtas";
    userEmail = "benas.kiburtas@protonmail.com";

    # Delta-specific configuration
    extraConfig = {
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta.navigate = true;
      merge.conflictStyle = "zdiff3";
    };
  };
}
