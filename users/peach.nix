{ config, pkgs, ... }:
let
  userInfo = {
    username = "peach";
    fullName = "REDACTED";
    email = "REDACTED";
  };
in
{
  users.users.peach = {
    isNormalUser = true;
    description = userInfo.fullName;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.fish;
  };

  # Home Manager configuration
  home-manager.users.peach =
    {
      config,
      pkgs,
      ...
    }:
    {
      imports = [
        ../home/default.nix
      ];

      home = {
        username = "peach";
        homeDirectory = "/home/peach";
        stateVersion = "25.11";
      };
      _module.args = { inherit userInfo; };
    };
}
