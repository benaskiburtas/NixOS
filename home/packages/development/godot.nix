# Tools for working with GDScript and Godot
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gdtoolkit_4
    godot_4
  ];
}
