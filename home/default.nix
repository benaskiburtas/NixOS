# Home-manager entry point
{
  config,
  pkgs,
  lobster,
  ...
}:

{
  imports = [
    ./packages
    ./programs
  ];
}
