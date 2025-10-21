# Main flake-parts configuration
# This file defines the flake outputs using flake-parts modules
inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
  # Import flake-file's module system
  imports = [
    inputs.flake-file.flakeModules.default
  ];

  # System architectures to support
  systems = [
    "x86_64-linux"
    "aarch64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];

  # Flake-file configuration for generating flake.nix
  flake-file = {
    # Define inputs that should be included in flake.nix
    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      flake-parts.url = "github:hercules-ci/flake-parts";
      flake-file.url = "github:vic/flake-file";

      # Optional module inputs (uncomment as needed)
      # home-manager.url = "github:nix-community/home-manager";
      # treefmt-nix.url = "github:numtide/treefmt-nix";
      # devshell.url = "github:numtide/devshell";
      # pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
      # agenix-rekey.url = "github:oddlama/agenix-rekey";
      # haskell-flake.url = "github:srid/haskell-flake";
      # services-flake.url = "github:juspay/services-flake";
      # ez-configs.url = "github:ehllie/ez-configs";
    };
  };

  # Per-system configuration
  perSystem = { config, pkgs, system, ... }: {
    # Example: Define a development shell
    # devShells.default = pkgs.mkShell {
    #   buildInputs = with pkgs; [
    #     git
    #     nixpkgs-fmt
    #   ];
    # };

    # Example: Define a formatter
    # formatter = pkgs.nixpkgs-fmt;
  };
}
