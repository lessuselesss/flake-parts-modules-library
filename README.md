# Flake-Parts Modules Library

This repository provides a curated library of flake-parts modules and Nix ecosystem reference documentation.

## Quick Usage

Add to your flake inputs:

```nix
{
  inputs = {
    flake-parts-lib.url = "github:lessuselesss/flake-parts-modules-library";
    # Add upstream modules you want to use
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.flake-parts-lib.flakeModules.treefmt-nix
      ];
    };
}
```

See [USAGE.md](USAGE.md) for complete documentation and examples.

## What's Included

### 18 Pre-Configured Flake-Parts Modules

All modules include comprehensive inline documentation with types, defaults, and examples.

**Configuration Management:**
- home-manager, ez-configs

**Development Tools:**
- devshell, devenv, flake-root, haskell-flake, input-branches, mission-control, std

**Code Quality:**
- treefmt-nix, pre-commit-hooks-nix

**Security:**
- agenix-rekey, agenix-shell

**Services & Process Management:**
- services-flake, process-compose-flake

**Infrastructure & CI/CD:**
- disko, hercules-ci-effects, nix-topology

See [modules/README.md](modules/README.md) for detailed module documentation.

### Nix Ecosystem Reference Documentation

The `.claude/docs/reference-libraries/` directory contains XML documentation for 28+ Nix ecosystem projects including:

- **Core**: nixpkgs-lib, flake-utils, flake-file
- **Config Management**: home-manager, nix-darwin, impermanence
- **Security**: agenix, sops-nix, vulnix
- **Tools**: nh, nix-direnv, treefmt-nix, nickel tooling
- **Package Repos**: NUR, nur-search

## Features

- ✅ **Pre-configured** - All boilerplate handled
- ✅ **Well-documented** - Inline comments for every option
- ✅ **Type-safe** - Proper typing throughout
- ✅ **Consistent** - Uniform structure across modules
- ✅ **Template-friendly** - GitHub template repository
- ✅ **Modular** - Import only what you need

## Usage Examples

### Simple: Single Module

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts-lib.url = "github:lessuselesss/flake-parts-modules-library";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.flake-parts-lib.flakeModules.treefmt-nix
      ];

      systems = [ "x86_64-linux" ];

      perSystem = { ... }: {
        treefmt.programs.nixpkgs-fmt.enable = true;
      };
    };
}
```

### Advanced: Multiple Modules

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts-lib.url = "github:lessuselesss/flake-parts-modules-library";

    # Upstream dependencies
    devenv.url = "github:cachix/devenv";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    mission-control.url = "github:Platonic-Systems/mission-control";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.flake-parts-lib.flakeModules.devenv
        inputs.flake-parts-lib.flakeModules.treefmt-nix
        inputs.flake-parts-lib.flakeModules.mission-control
      ];

      systems = [ "x86_64-linux" "aarch64-linux" ];

      perSystem = { pkgs, ... }: {
        devenv.shells.default = {
          languages.nix.enable = true;
          languages.python.enable = true;
        };

        treefmt.programs = {
          nixpkgs-fmt.enable = true;
          black.enable = true;
        };

        mission-control.scripts = {
          fmt = {
            exec = "nix fmt";
            description = "Format code";
          };
        };
      };
    };
}
```

## Documentation

- [USAGE.md](USAGE.md) - Complete usage guide with examples
- [modules/README.md](modules/README.md) - Detailed module reference
- [CLAUDE.md](CLAUDE.md) - AI assistant guidance for this repository

## Verifying Exports

Check that modules are exported correctly:

```bash
nix flake show github:lessuselesss/flake-parts-modules-library
```

## Contributing

This is a GitHub template repository. You can:

1. **Fork it** - Use as a template for your own module collection
2. **Contribute** - Submit PRs to add more modules
3. **Report Issues** - Help improve documentation

When adding modules:
- Follow the existing format with inline documentation
- Include all options with types and defaults
- Provide usage examples
- Update documentation files

## Resources

- [flake-parts Documentation](https://flake.parts/)
- [Awesome flake-parts](https://github.com/wearetechnative/awesome-flake-parts)
- [NixOS Wiki](https://nixos.wiki/)

## License

MIT - See LICENSE file for details
