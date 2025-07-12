# Universal packages for software development
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # -----------------------------------------------------------
    # Development Tools
    # -----------------------------------------------------------
    asdf-vm # Multi-language version manager, command: asdf
    lunarvim # Neovim distribution, command: lvim
    tokei # Code counter, command: tokei
    vscodium-fhs # Open source code editor (GUI)
  ];
}