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

  # Flake outputs
  flake = {
    # Export all modules as flakeModules for easy importing
    flakeModules = {
      # Configuration Management
      home-manager = ./modules/home-manager.nix;
      ez-configs = ./modules/ez-configs.nix;

      # Development Tools
      devshell = ./modules/devshell.nix;
      devenv = ./modules/devenv.nix;
      flake-root = ./modules/flake-root.nix;
      haskell-flake = ./modules/haskell-flake.nix;
      input-branches = ./modules/input-branches.nix;
      mission-control = ./modules/mission-control.nix;
      std = ./modules/std.nix;

      # Code Quality & Formatting
      treefmt-nix = ./modules/treefmt-nix.nix;
      pre-commit-hooks-nix = ./modules/pre-commit-hooks-nix.nix;

      # Secrets Management
      agenix-rekey = ./modules/agenix-rekey.nix;
      agenix-shell = ./modules/agenix-shell.nix;

      # Services & Process Management
      services-flake = ./modules/services-flake.nix;
      process-compose-flake = ./modules/process-compose-flake.nix;

      # Infrastructure & System Configuration
      disko = ./modules/disko.nix;

      # CI/CD & Deployment
      hercules-ci-effects = ./modules/hercules-ci-effects.nix;

      # Visualization & Documentation
      nix-topology = ./modules/nix-topology.nix;
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
