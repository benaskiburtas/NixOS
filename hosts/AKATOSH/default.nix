# Default module for AKATOSH host - imports hardware and host-specific settings
{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix # Auto-generated hardware config
    ./host-specific.nix # Host-specific settings
  ];
}
