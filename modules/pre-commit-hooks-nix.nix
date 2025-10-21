# pre-commit-hooks-nix (git-hooks-nix) flake-parts module
# https://flake.parts/options/pre-commit-hooks-nix
#
# Provides git pre-commit hooks integration with Nix for enforcing
# code quality and formatting standards.
#
# Usage:
#   Add to your flake inputs:
#     pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
#
#   Then import this module:
#     imports = [ ./modules/pre-commit-hooks-nix.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.pre-commit-hooks.flakeModule
  ];

  perSystem = { config, pkgs, ... }: {
    pre-commit = {
      ## Core Configuration

      # check.enable - Type: boolean - Default: true
      # Description: Adds derivation to flake checks that validates pre-commit
      #              during `nix flake check`. Disable if hooks require network
      #              or don't function in Nix sandbox.
      # check.enable = true;

      # devShell - Type: package (read-only)
      # Description: Development shell with installed git hooks and packages

      # installationScript - Type: string (read-only)
      # Description: Bash script that configures git hooks in repository

      # pkgs - Type: lazy attribute set
      # Default: pkgs module argument
      # Description: Nixpkgs for pre-commit settings configuration
      # pkgs = pkgs;

      settings = {
        ## General Settings

        # enable - Type: boolean - Default: true
        # Description: Enables the pre-commit hooks module
        # enable = true;

        # package - Type: package - Default: pkgs.pre-commit
        # Description: The pre-commit package to execute
        # package = pkgs.pre-commit;

        # addGcRoot - Type: boolean - Default: true
        # Description: Prevents Nix GC of hook tools by adding config to GC roots
        # addGcRoot = true;

        # configPath - Type: string - Default: ".pre-commit-config.yaml"
        # Description: Relative project path for generated pre-commit config file
        # configPath = ".pre-commit-config.yaml";

        # default_stages - Type: list of strings - Default: ["pre-commit"]
        # Description: Global stage restriction
        # Valid stages: commit-msg, post-checkout, post-commit, post-merge,
        #              post-rewrite, pre-commit, pre-merge-commit, pre-push,
        #              pre-rebase, prepare-commit-msg, manual, commit, push, merge-commit
        # default_stages = ["pre-commit"];

        # excludes - Type: list of strings - Default: []
        # Description: File patterns to exclude from all hooks
        # excludes = [];

        # gitPackage - Type: package - Default: pkgs.gitMinimal
        # Description: Git package for hook execution
        # gitPackage = pkgs.gitMinimal;

        ## Hooks Configuration
        # Each hook has the following options:

        hooks = {
          # <name>.enable - Type: boolean - Default: false
          # Description: Activates specific pre-commit hook

          # <name>.entry - Type: string (required)
          # Description: Executable or command to run (can include fixed args)

          # <name>.language - Type: string - Default: "system"
          # Description: Specifies how pre-commit should install the hook

          # <name>.files - Type: string - Default: ""
          # Description: Regex pattern matching files to process

          # <name>.pass_filenames - Type: boolean - Default: true
          # Description: Whether filenames are passed as arguments

          # <name>.stages - Type: list of strings
          # Default: inherited from default_stages
          # Description: Restricts hook execution to specified stages

          # <name>.types - Type: list of strings - Default: ["file"]
          # Description: File types triggering the hook

          # <name>.exclude_types - Type: list of strings - Default: []
          # Description: File types to exclude

          # <name>.args - Type: list of strings - Default: []
          # Description: Additional parameters passed to hook

          # <name>.always_run - Type: boolean - Default: false
          # Description: Executes hook regardless of matching files

          # <name>.fail_fast - Type: boolean - Default: false
          # Description: Stops subsequent hooks upon failure

          # <name>.require_serial - Type: boolean - Default: false
          # Description: Disables parallel execution

          # <name>.verbose - Type: boolean - Default: false
          # Description: Prints output even for passing hooks

          # Example configuration:
          # nixpkgs-fmt = {
          #   enable = true;
          #   entry = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
          #   files = "\\.nix$";
          # };

          # alejandra.enable = true;
          # deadnix.enable = true;
          # statix.enable = true;
        };
      };
    };
  };
}
