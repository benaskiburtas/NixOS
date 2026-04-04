{ pkgs, ... }:
{
  users.users.peach = {
    isNormalUser = true;
    description = "Peach";
    extraGroups = [
      "networkmanager"
      "wheel"
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
        sessionVariables.EDITOR = "nvim";
      };

      sops.age.keyFile = "/home/peach/.config/sops/age/keys.txt";
      sops.secrets.git_email = {
        sopsFile = ../secrets/peach.yaml;
      };
      sops.secrets.git_name = {
        sopsFile = ../secrets/peach.yaml;
      };
      home.activation.gitSecrets = lib.hm.dag.entryAfter [ "setupSecrets" ] ''
        mkdir -p ~/.config/git
        install -m 600 /dev/null ~/.config/git/secrets.inc
        echo "[user]" > ~/.config/git/secrets.inc
        echo "  email = $(cat ${config.sops.secrets.git_email.path})" >> ~/.config/git/secrets.inc
        echo "  name = $(cat ${config.sops.secrets.git_name.path})" >> ~/.config/git/secrets.inc
      '';
    };
}
