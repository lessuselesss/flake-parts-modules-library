# agenix-shell flake-parts module
# https://flake.parts/options/agenix-shell
#
# Provides age-encrypted secrets management for development shells.
# Decrypts secrets and exposes them as environment variables in devShells.
#
# Usage:
#   Add to your flake inputs:
#     agenix-shell.url = "github:aciceri/agenix-shell";
#
#   Then import this module:
#     imports = [ ./modules/agenix-shell.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.agenix-shell.flakeModule
  ];

  flake = {
    agenix-shell = {
      ## Top-Level Configuration

      # identityPaths - Type: list of string
      # Default: ["$HOME/.ssh/id_ed25519" "$HOME/.ssh/id_rsa"]
      # Description: Paths to SSH keys used as identities for age decryption
      # identityPaths = [
      #   "$HOME/.ssh/id_ed25519"
      #   "$HOME/.ssh/id_rsa"
      # ];

      # secrets - Type: attribute set of submodule
      # Description: Attrset of secrets to decrypt and expose
      # secrets = {
      #   example-secret = {
      #     ## Secret Configuration

      #     # file - Type: absolute path - Required
      #     # Description: Age file the secret is loaded from
      #     file = ./secrets/example.age;

      #     # mode - Type: string - Default: "0400"
      #     # Description: Permissions mode for decrypted secret (chmod format)
      #     mode = "0400";

      #     # name - Type: shell variable name - Default: <name>
      #     # Description: Name of the variable containing the secret content
      #     # Will be available as: $EXAMPLE_SECRET
      #     name = "EXAMPLE_SECRET";

      #     # namePath - Type: shell variable name - Default: <name>_PATH
      #     # Description: Name of the variable containing path to the secret
      #     # Will be available as: $EXAMPLE_SECRET_PATH
      #     namePath = "EXAMPLE_SECRET_PATH";
      #   };

      #   api-key = {
      #     file = ./secrets/api-key.age;
      #     mode = "0400";
      #     name = "API_KEY";
      #     namePath = "API_KEY_PATH";
      #   };

      #   database-password = {
      #     file = ./secrets/db-password.age;
      #     name = "DB_PASSWORD";
      #   };
      # };
    };
  };

  perSystem = { config, pkgs, ... }: {
    agenix-shell = {
      # agePackage - Type: package - Default: pkgs.rage
      # Description: The age package to use for decryption
      # agePackage = pkgs.rage;
      # # Or use age instead of rage:
      # # agePackage = pkgs.age;

      # installationScript - Type: package (read-only)
      # Description: Auto-generated script that exports secrets as environment
      #              variables for integration with devShell
      #              Usage: Add to devShell.shellHook:
      #              shellHook = ''
      #                ${config.agenix-shell.installationScript}
      #              '';
    };

    # Example integration with devShell:
    # devShells.default = pkgs.mkShell {
    #   shellHook = ''
    #     # Decrypt and load secrets
    #     ${config.agenix-shell.installationScript}
    #
    #     echo "Secrets loaded:"
    #     echo "  API_KEY is available"
    #     echo "  API_KEY_PATH: $API_KEY_PATH"
    #   '';
    # };
  };
}
