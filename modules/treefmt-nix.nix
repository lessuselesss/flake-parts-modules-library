# treefmt-nix flake-parts module
# https://flake.parts/options/treefmt-nix.html
#
# treefmt-nix provides declarative formatter configuration for Nix projects
# using treefmt with flake-parts integration.
#
# Usage:
#   Add to your flake inputs:
#     treefmt-nix.url = "github:numtide/treefmt-nix";
#
#   Then import this module:
#     imports = [ ./modules/treefmt-nix.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem = { config, pkgs, ... }: {
    # treefmt configuration
    treefmt = {
      # Project-level treefmt configuration
      # Type: submodule
      # Default: { }
      # Access the resulting package via config.treefmt.build.wrapper

      ## Build Outputs (read-only)
      # build.wrapper        - Type: package - wrapped treefmt command
      # build.configFile     - Type: path - generated configuration file
      # build.devShell       - Type: package - dev shell with treefmt and formatters
      # build.programs       - Type: attrs - enabled formatter programs
      # build.check          - Type: function - flake check for formatted tree

      ## Global Settings
      # enableDefaultExcludes - Type: boolean - Default: true
      # package              - Type: package - Default: pkgs.treefmt
      # pkgs                 - Type: attrs - Default: pkgs
      # flakeCheck           - Type: boolean - Default: true - add flake check
      # flakeFormatter       - Type: boolean - Default: true - enable as default formatter

      ## Available Formatters (each has: enable, package, includes, excludes, priority)
      # programs.actionlint   - YAML/GitHub Actions linter
      # programs.alejandra    - Nix formatter
      # programs.asmfmt       - Go assembly formatter
      # programs.autopep8     - Python formatter
      # programs.beautysh     - Shell script beautifier
      # programs.biome        - Web formatter (JS/TS/JSON)
      # programs.black        - Python formatter
      # programs.cabal-fmt    - Haskell Cabal formatter
      # programs.clang-format - C/C++/Java/etc formatter
      # programs.cljfmt       - Clojure formatter
      # programs.cmake-format - CMake formatter
      # programs.crystal      - Crystal formatter
      # programs.csharpier    - C# formatter
      # programs.dart-format  - Dart formatter
      # programs.deadnix      - Nix dead code finder
      # programs.denofmt      - Deno formatter
      # programs.dhall        - Dhall formatter
      # programs.djlint       - Django/Jinja template linter/formatter
      # programs.dprint       - Multi-language formatter
      # programs.elm-format   - Elm formatter
      # programs.erlfmt       - Erlang formatter
      # programs.fnlfmt       - Fennel formatter
      # programs.fourmolu     - Haskell formatter
      # programs.gdformat     - GDScript formatter (Godot)
      # programs.gleam        - Gleam formatter
      # programs.gofmt        - Go formatter
      # programs.gofumpt      - Stricter gofmt
      # programs.goimports    - Go imports formatter
      # programs.golines      - Go long line formatter
      # programs.google-java-format - Google's Java formatter
      # programs.hindent      - Haskell formatter
      # programs.hlint        - Haskell linter
      # programs.hpack        - Haskell package.yaml to .cabal
      # programs.html-tidy    - HTML formatter
      # programs.isort        - Python import sorter
      # programs.jsonformat   - JSON formatter
      # programs.jsonfmt      - JSON formatter
      # programs.ktlint       - Kotlin linter/formatter
      # programs.leptosfmt    - Leptos view formatter
      # programs.mdformat     - Markdown formatter
      # programs.mdsh         - Markdown shell code validator
      # programs.mix-format   - Elixir formatter
      # programs.muon         - Muon (Meson) formatter
      # programs.mypy         - Python type checker
      # programs.nickel       - Nickel formatter
      # programs.nixfmt       - Nix formatter (RFC style)
      # programs.nixpkgs-fmt  - Nix formatter
      # programs.ocamlformat  - OCaml formatter
      # programs.ormolu       - Haskell formatter
      # programs.packer       - Packer HCL formatter
      # programs.php-cs-fixer - PHP formatter
      # programs.prettier     - Web formatter (JS/TS/CSS/HTML/etc)
      # programs.protolint    - Protobuf linter
      # programs.purs-tidy    - PureScript formatter
      # programs.pylint       - Python linter
      # programs.remark       - Markdown formatter
      # programs.rescript     - ReScript formatter
      # programs.rubocop      - Ruby linter/formatter
      # programs.ruff         - Fast Python linter/formatter
      # programs.rufo         - Ruby formatter
      # programs.rustfmt      - Rust formatter
      # programs.scalafmt     - Scala formatter
      # programs.shellcheck   - Shell script linter
      # programs.shfmt        - Shell formatter
      # programs.sqlfluff     - SQL linter/formatter
      # programs.standardjs   - JavaScript Standard Style
      # programs.standardrb   - Ruby Standard Style
      # programs.statix       - Nix linter
      # programs.stylish-haskell - Haskell formatter
      # programs.stylelint    - CSS linter
      # programs.stylua       - Lua formatter
      # programs.swift-format - Swift formatter
      # programs.taplo        - TOML formatter
      # programs.terraform    - Terraform formatter
      # programs.typstfmt     - Typst formatter
      # programs.typos        - Spell checker
      # programs.vale         - Prose linter
      # programs.yamlfmt      - YAML formatter
      # programs.yapf         - Python formatter
      # programs.zigfmt       - Zig formatter
      # programs.zprint       - Clojure formatter

      # Example configuration:
      # package = pkgs.treefmt;
      # flakeCheck = true;
      # flakeFormatter = true;
      # programs.alejandra.enable = true;
      # programs.prettier.enable = true;
    };
  };
}
