# System configuration selector
{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Select which host configuration to use
  imports = [
    # Import base system configuration
    ./configuration.nix

    # Import host-specific configuration
    ./hosts/AKATOSH

    # Import user-specific configuration(s)
    ./users/peach.nix
  ];
}
