# nix-topology flake-parts module
# https://flake.parts/options/nix-topology.html
#
# Automatically generate infrastructure and network diagrams as SVGs
# directly from your NixOS configurations.
#
# Usage:
#   Add to your flake inputs:
#     nix-topology.url = "github:oddlama/nix-topology";
#
#   Then import this module:
#     imports = [ ./modules/nix-topology.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.nix-topology.flakeModule
  ];

  # flake.topology - Type: lazy attribute set (read-only)
  # Default: Automatically filled by nix-topology
  # Description: Contains the evaluated topology configuration per system
  #              Build output via: nix build .#topology.$system.config.output

  perSystem = { config, pkgs, ... }: {
    topology = {
      ## Core Configuration

      # modules - Type: list of unspecified values - Default: [ ]
      # Description: Additional topology modules for evaluation in the global
      #              topology configuration
      # modules = [
      #   # Custom topology module definitions
      # ];

      # nixosConfigurations - Type: lazy attribute set
      # Default: Filters self.nixosConfigurations to include only those
      #          with topology definitions
      # Description: Specifies which NixOS systems to evaluate for topology
      # nixosConfigurations = {
      #   # Automatically populated from self.nixosConfigurations
      #   # Only includes systems with topology definitions
      # };

      # pkgs - Type: unspecified value - Default: pkgs (module argument)
      # Description: Package set used during topology evaluation on the
      #              current system
      # pkgs = pkgs;
    };
  };
}
