{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lobster = {
      url = "github:justchokingaround/lobster";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      lobster,
      ...
    }@inputs:
    let
      systemConfig = import ./config.nix;
      host = systemConfig.host;

      hostConfig = import ./hosts/${host}/config.nix;
      architecture = hostConfig.meta.architecture;
      hostName = hostConfig.meta.hostName;

      mainConfig =
        {
          config,
          lib,
          pkgs,
          ...
        }:
        {
          imports = [
            ./configuration.nix
            hostConfig.module
          ] ++ (map (user: ./users/${user}.nix) systemConfig.users);
        };
    in
    {
      formatter.${architecture} = nixpkgs.legacyPackages.${architecture}.nixfmt-tree;
      nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
        system = architecture;
        modules = [
          mainConfig
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit lobster; };
          }
        ];
        specialArgs = { inherit lobster; };
      };
    };
}
