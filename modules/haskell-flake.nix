# haskell-flake flake-parts module
# https://flake.parts/options/haskell-flake.html
#
# Automatically discovers Haskell projects and builds them using Nixpkgs infrastructure.
# Provides packages, checks, apps, and development shells for Haskell development.
#
# Usage:
#   Add to your flake inputs:
#     haskell-flake.url = "github:srid/haskell-flake";
#
#   Then import this module:
#     imports = [ ./modules/haskell-flake.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.haskell-flake.flakeModule
  ];

  perSystem = { config, pkgs, ... }: {
    # Main configuration for Haskell projects
    # Type: attribute set of submodule
    haskellProjects = {
      # default = {
        ## Core Options

        # projectRoot - Type: path - Default: Flake root
        # Description: Project directory location
        # projectRoot = ./.;

        # basePackages - Type: attribute set - Default: pkgs.haskellPackages
        # Description: Haskell package set/GHC version to use
        # basePackages = pkgs.haskellPackages;
        # # Or specify GHC version:
        # # basePackages = pkgs.haskell.packages.ghc944;

        # packages - Type: attribute set - Default: Auto-discovered
        # Description: Additional packages to include beyond auto-discovered ones
        # packages = {
        #   # my-package = ./my-package;
        # };

        # autoWire - Type: list of strings
        # Default: ["packages" "checks" "apps" "devShells"]
        # Description: Flake outputs to automatically generate
        # autoWire = ["packages" "checks" "apps" "devShells"];

        ## Development Shell Configuration

        # devShell.enable - Type: boolean - Default: true
        # Description: Activate development shell
        # devShell.enable = true;

        # devShell.hoogle - Type: boolean - Default: true
        # Description: Include Hoogle documentation server
        # devShell.hoogle = true;

        # devShell.benchmark - Type: boolean - Default: false
        # Description: Include benchmark dependencies in shell
        # devShell.benchmark = false;

        # devShell.tools - Type: function - Default: (merged defaults)
        # Description: Build tools available in development shell
        # devShell.tools = hp: {
        #   cabal-install = {};
        #   haskell-language-server = {};
        #   ghcid = {};
        #   fourmolu = {};
        # };

        # devShell.extraLibraries - Type: function - Default: null
        # Description: Extra Haskell libraries for ghci/runghc
        # devShell.extraLibraries = hp: [
        #   hp.aeson
        #   hp.lens
        # ];

        # devShell.mkShellArgs - Type: attribute set - Default: {}
        # Description: Additional arguments passed to mkShell
        # devShell.mkShellArgs = {
        #   shellHook = ''
        #     echo "Welcome to Haskell development!"
        #   '';
        # };

        ## Package Settings
        # settings - Type: attribute set of functions
        # Description: Overrides for packages in basePackages and custom packages
        #              Receives context: package name, reference, self/super, nixpkgs
        # settings = {
        #   my-package = {
        #     # Package-specific overrides
        #   };
        # };

        ## Outputs (Read-only)
        # outputs.packages       - Local packages with derivations and executables
        # outputs.apps           - Flake apps for Cabal executables
        # outputs.checks         - Generated flake checks
        # outputs.devShell       - Development shell derivation
        # outputs.finalPackages  - Complete Haskell package set
      # };
    };

    ## Testing Configuration
    # haskellProjectTests - Type: attribute set of submodule
    # Description: Define tests for Haskell project configurations
    # haskellProjectTests = {
    #   test-name = {
    #     from = "default";                    # Source project to patch
    #     patches = [ ./test.patch ];          # Diff files or inline patches
    #     extraHaskellProjectConfig = {};      # Additional configuration
    #     expect = /* ... */;                  # Expression to evaluate in check
    #   };
    # };
  };

  flake = {
    # Project Modules (Read-only)
    # Type: lazy attribute set of modules
    # Description: Exposes modules for reusing this project as a dependency
    # haskellFlakeProjectModules = { };
  };
}
