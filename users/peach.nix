{ config, pkgs, ... }:
{
  # NixOS user configuration
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

  # Home Manager configuration
  home-manager.users.peach =
    {
      config,
      pkgs,
      lobster,
      ...
    }:
    {
      imports = [
        ../home/default.nix
      ];

      home = {
        username = "peach";
        homeDirectory = "/home/peach";
        stateVersion = "25.05";
      };
    };
}
