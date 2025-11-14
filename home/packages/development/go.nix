# Packages for building Go applications
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    delve # Go debugger, command: dlv
    go # Go compiler and toolchain, command: go
    golangci-lint # Go linter aggregator, command: golangci-lint
    gopls # Go language server, command: gopls
    gotools # Additional Go tools (goimports, godoc, etc.)
    jetbrains.goland # JetBrains GoLand IDE (GUI)
  ];
}
