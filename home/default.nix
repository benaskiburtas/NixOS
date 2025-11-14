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
