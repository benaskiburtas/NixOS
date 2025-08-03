# Home-manager entry point
{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./packages
    ./programs
  ];
}
