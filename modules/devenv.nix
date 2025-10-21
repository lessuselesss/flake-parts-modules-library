# devenv flake-parts module
# https://flake.parts/options/devenv.html
#
# Fast, declarative, reproducible development environments using devenv.sh.
# Provides extensive language support, integrations, and container management.
#
# Usage:
#   Add to your flake inputs:
#     devenv.url = "github:cachix/devenv";
#
#   Then import this module:
#     imports = [ ./modules/devenv.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.devenv.flakeModule
  ];

  perSystem = { config, pkgs, ... }: {
    devenv = {
      # modules - Type: list
      # Description: Extra devenv modules to import
      # modules = [ ];

      # shells - Type: attribute set of submodule
      # Description: Named development environments
      # Each shell generates a corresponding devShells.<name> output
      shells = {
        # default = {
          ## Core Configuration

          # packages - Type: list of packages
          # Description: Packages available in the environment
          # packages = with pkgs; [
          #   git
          #   curl
          # ];

          ## Environment Variables

          # env - Type: attribute set
          # Description: Environment variables
          # env = {
          #   MY_VAR = "value";
          # };

          ## Files

          # files - Type: attribute set
          # Description: Files to create in the environment
          # files = {
          #   ".envrc".text = "use flake";
          # };

          ## Language Support
          # All language options default to disabled
          # Each provides version management, tools, and language-specific config

          # languages.ansible.enable = true;
          # languages.c.enable = true;
          # languages.cplusplus.enable = true;
          # languages.dart.enable = true;
          # languages.deno.enable = true;
          # languages.elixir.enable = true;
          # languages.elm.enable = true;
          # languages.erlang.enable = true;
          # languages.gawk.enable = true;
          # languages.go.enable = true;
          # languages.haskell.enable = true;
          # languages.java.enable = true;
          # languages.javascript.enable = true;
          # languages.julia.enable = true;
          # languages.kotlin.enable = true;
          # languages.lua.enable = true;
          # languages.nim.enable = true;
          # languages.nix.enable = true;
          # languages.ocaml.enable = true;
          # languages.perl.enable = true;
          # languages.php.enable = true;
          # languages.purescript.enable = true;
          # languages.python.enable = true;
          # languages.python.version = "3.11";
          # languages.python.venv.enable = true;
          # languages.r.enable = true;
          # languages.ruby.enable = true;
          # languages.rust.enable = true;
          # languages.scala.enable = true;
          # languages.shell.enable = true;
          # languages.swift.enable = true;
          # languages.terraform.enable = true;
          # languages.texlive.enable = true;
          # languages.typescript.enable = true;
          # languages.unison.enable = true;
          # languages.v.enable = true;
          # languages.zig.enable = true;

          ## Integrations
          # Third-party tool support (all default to disabled)

          # aws-vault.enable = true;
          # cachix.enable = true;
          # docker.enable = true;
          # git-hooks.enable = true;         # pre-commit hooks
          # google-cloud-sdk.enable = true;
          # idx.enable = true;                # Google Project IDX support
          # pulumi.enable = true;

          ## Container Support

          # containers.<name>.name = "my-container";
          # containers.<name>.image = "docker://ubuntu:latest";
          # containers.<name>.command = ["bash"];
          # containers.<name>.env = { };
          # containers.<name>.mounts = [ ];

          ## Development Tools

          # certificates = [ ];               # TLS certificates
          # hosts = { };                      # /etc/hosts entries
          # infoSections = [ ];               # Info displayed on shell entry
          # tasks = { };                      # Background tasks/services

          ## Shell Hooks

          # enterShell = ''
          #   echo "Welcome to the development environment!"
          # '';

          # enterTest = ''
          #   # Commands to run for testing
          # '';

          # pre-commit.hooks - Git hooks configuration
          # pre-commit.hooks.nixpkgs-fmt.enable = true;
          # pre-commit.hooks.shellcheck.enable = true;

          ## Process Management

          # processes.<name>.exec = "command";
          # processes.<name>.process-compose = {
          #   # process-compose configuration
          # };

          ## Services
          # Built-in service support (all default to disabled)

          # services.adminer.enable = true;
          # services.blackfire.enable = true;
          # services.caddy.enable = true;
          # services.clickhouse.enable = true;
          # services.couchdb.enable = true;
          # services.elasticsearch.enable = true;
          # services.mailpit.enable = true;
          # services.meilisearch.enable = true;
          # services.minio.enable = true;
          # services.mongodb.enable = true;
          # services.mysql.enable = true;
          # services.nginx.enable = true;
          # services.opensearch.enable = true;
          # services.postgres.enable = true;
          # services.rabbitmq.enable = true;
          # services.redis.enable = true;
          # services.temporal.enable = true;
          # services.vault.enable = true;
          # services.varnish.enable = true;
          # services.wiremock.enable = true;
        # };
      };
    };
  };
}
