{ pkgs, ... }:
{
  users.users.peach = {
    isNormalUser = true;
    description = "Peach";
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
      lib,
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

      sops.age.keyFile = "/home/peach/.config/sops/age/keys.txt";
      sops.secrets.email = {
        sopsFile = ../secrets/peach.yaml;
      };
      sops.secrets.fullname = {
        sopsFile = ../secrets/peach.yaml;
      };
      home.activation.gitSecrets = lib.hm.dag.entryAfter [ "sops" ] ''
        mkdir -p ~/.config/git
        echo "[user]" > ~/.config/git/secrets.inc
        echo "  email = $(cat ${config.sops.secrets.email.path})" >> ~/.config/git/secrets.inc
        echo "  name = $(cat ${config.sops.secrets.fullname.path})" >> ~/.config/git/secrets.inc
      '';
    };
}
