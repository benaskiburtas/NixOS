# User-specific system configuration for 'peach'
{ config, pkgs, ... }:

{
  # User account configuration
  users.users.peach = {
    isNormalUser = true;
    description = "Peach";
    extraGroups = [
      "networkmanager" # Network configuration privileges
      "wheel" # Sudo access
      "docker" # Access to Docker socket
    ];
    shell = pkgs.fish;
  };
}
