{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      host = "AKATOSH"; # Maps to configuration in hosts/
      users = [ "peach" ]; # Maps to configurations in users/

      hostConfig = import ./hosts/${host};
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
          ]
          ++ (map (user: ./users/${user}.nix) users);
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
          }
        ];
      };
    };
}
