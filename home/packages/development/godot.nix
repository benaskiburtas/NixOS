# Tools for working with GDScript and Godot
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gdtoolkit_4 # GDScript parser/linter/formatter, command: gdtoolkit
    godot_4 # 2D and 3D game engine (GUI)
  ];
}
