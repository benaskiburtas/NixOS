# Universal packages for software development
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # -----------------------------------------------------------
    # Development Tools
    # -----------------------------------------------------------
    asdf-vm # Multi-language version manager, command: asdf
    tokei # Code counter, command: tokei
    vim # Text editor, command: vim
    vscodium-fhs # Open source code editor (GUI)
  ];
}
