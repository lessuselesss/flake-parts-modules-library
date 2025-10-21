# input-branches flake-parts module
# https://flake.parts/options/input-branches.html
#
# Manages flake inputs using Git submodules and branches, allowing you to
# track and rebase input changes more easily than with standard flake locks.
#
# Usage:
#   Add to your flake inputs:
#     input-branches.url = "github:Platonic-Systems/input-branches";
#
#   Then import this module:
#     imports = [ ./modules/input-branches.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.input-branches.flakeModule
  ];

  flake = {
    input-branches = {
      ## Core Configuration

      # baseDir - Type: string - Default: "inputs"
      # Description: Directory for Git submodules, relative to repository root
      # baseDir = "inputs";

      # inputs - Type: attribute set - Default: { }
      # Description: Definitions for input branches
      #              Keys must match existing flake inputs
      # inputs = {
      #   nixpkgs = {
      #     ## Input Configuration

      #     # name - Type: string - Default: <name>
      #     # Description: Identifier matching a flake input name
      #     name = "nixpkgs";

      #     # path_ - Type: string - Default: inputs/<name>
      #     # Description: Submodule location relative to Git root
      #     path_ = "inputs/nixpkgs";

      #     # shallow - Type: boolean - Default: false
      #     # Description: Enable shallow fetching (useful for large repos)
      #     shallow = true;

      #     ## Upstream Configuration

      #     # upstream.url - Type: string - Required
      #     # Description: Git repository URL
      #     upstream.url = "https://github.com/NixOS/nixpkgs.git";

      #     # upstream.ref - Type: string - Required
      #     # Description: Branch or ref to track (e.g., "nixpkgs-unstable", "master")
      #     upstream.ref = "nixpkgs-unstable";

      #     # upstream.name - Type: string - Default: "upstream"
      #     # Description: Remote name for upstream repository
      #     upstream.name = "upstream";
      #   };

      #   home-manager = {
      #     name = "home-manager";
      #     shallow = true;
      #     upstream = {
      #       url = "https://github.com/nix-community/home-manager.git";
      #       ref = "master";
      #     };
      #   };
      # };
    };
  };

  perSystem = { config, pkgs, ... }: {
    # Available commands (automatically generated per input):
    #
    # commands.init
    #   - Initialize submodules
    #   - Generates: input-branch-init-<INPUT> scripts
    #
    # commands.rebase
    #   - Rebase input branches
    #   - Generates: input-branch-rebase-<INPUT> scripts
    #
    # commands.push-force
    #   - Force-push branches
    #   - Generates: input-branch-push-force-<INPUT> scripts
    #
    # commands.all
    #   - Convenience list combining all available commands
    #
    # Example usage:
    #   nix run .#input-branch-init-nixpkgs
    #   nix run .#input-branch-rebase-nixpkgs
    #   nix run .#input-branch-push-force-nixpkgs
  };
}
