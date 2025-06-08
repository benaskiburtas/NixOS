# Packages for building Java applications
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bacon # Background Rust code checker
    cargo-info # Sub-module for Cargo for package info, command: cargo info
    gcc # GNU Compiler Collection, command: gcc
    jetbrains.rust-rover # JetBrains Rust IDE (GUI)
    rustup # Rust Toolchain installer, command: rustup
    rusty-man # CLI viewer for rustdoc documentation, command: rusty-man
  ];
}
