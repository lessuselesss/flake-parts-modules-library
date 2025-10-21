# hercules-ci-effects flake-parts module
# https://flake.parts/options/hercules-ci-effects.html
#
# Provides CI/CD configuration, library functions, and deployment job templates
# for Hercules CI including automated flake updates, GitHub Pages, and releases.
#
# Usage:
#   Add to your flake inputs:
#     hercules-ci-effects.url = "github:hercules-ci/hercules-ci-effects";
#
#   Then import this module:
#     imports = [ ./modules/hercules-ci-effects.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.hercules-ci-effects.flakeModule
  ];

  # defaultEffectSystem - Type: string - Default: "x86_64-linux"
  # Description: System architecture for running effects
  # defaultEffectSystem = "x86_64-linux";

  flake = {
    herculesCI = {
      ## Core Configuration

      # ciSystems - Type: list of strings - Default: flake systems
      # Description: Systems to build in default push jobs
      # ciSystems = [ "x86_64-linux" "aarch64-linux" ];

      ## Flake Update Configuration
      # Automated dependency updates via scheduled jobs

      # flake-update.enable - Type: boolean - Default: false
      # Description: Activate scheduled flake lock updates
      # flake-update.enable = true;

      # flake-update.baseBranch - Type: string - Default: "HEAD"
      # Description: Target branch for updates
      # flake-update.baseBranch = "main";

      # flake-update.baseMerge.enable - Type: boolean - Default: false
      # Description: Merge base before updating
      # flake-update.baseMerge.enable = false;

      # flake-update.createPullRequest - Type: boolean - Default: true
      # Description: Auto-create PR with changes
      # flake-update.createPullRequest = true;

      # flake-update.updateBranch - Type: string - Default: "flake-update"
      # Description: Branch for update commits
      # flake-update.updateBranch = "flake-update";

      # flake-update.autoMergeMethod - Type: null or one of: "merge", "rebase", "squash"
      # Default: null
      # Description: Auto-merge strategy if enabled
      # flake-update.autoMergeMethod = "merge";

      # flake-update.forgeType - Type: string - Default: "github"
      # Description: Git server type (github/gitlab)
      # flake-update.forgeType = "github";

      # flake-update.flakes - Type: attribute set - Default: { "." = {}; }
      # Description: Flakes to update with input filtering
      # flake-update.flakes = {
      #   "." = {
      #     # inputs = [ "nixpkgs" "home-manager" ];  # Specific inputs only
      #   };
      # };

      ## GitHub Pages Configuration
      # Deploy documentation to GitHub Pages

      # github-pages.branch - Type: null or string - Default: null
      # Description: Branch triggering deployment (null disables)
      # github-pages.branch = "main";

      # github-pages.check.enable - Type: boolean - Default: true
      # Description: Build check inclusion
      # github-pages.check.enable = true;

      # github-pages.pushJob - Type: string - Default: "default"
      # Description: Job executing deployment
      # github-pages.pushJob = "default";

      # github-pages.settings - Type: module - Default: {}
      # Description: Effect configuration
      # github-pages.settings = { };

      ## GitHub Releases Configuration
      # Publish built artifacts as releases

      # github-releases.condition - Type: function
      # Default: { tag, ... }: tag != null
      # Description: Release trigger logic
      # github-releases.condition = { tag, ... }: tag != null;

      # github-releases.checkArtifacts - Type: function - Default: _: true
      # Description: Build verification condition
      # github-releases.checkArtifacts = _: true;

      # github-releases.files - Type: list of submodules - Default: []
      # Description: Static asset definitions
      # github-releases.files = [
      #   {
      #     label = "Binary";
      #     path = ./result/bin/program;
      #   }
      # ];

      # github-releases.filesPerSystem - Type: function
      # Description: System-specific asset generator
      # github-releases.filesPerSystem = system: [ ];

      # github-releases.releaseTag - Type: function
      # Default: Uses herculesCI.config.repo.tag
      # Description: Release tag assignment
      # github-releases.releaseTag = { tag, ... }: tag;

      # github-releases.systems - Type: null or list
      # Default: null (use ciSystems)
      # Description: Systems for artifact builds
      # github-releases.systems = [ "x86_64-linux" "aarch64-linux" ];

      # github-releases.pushJobName - Type: string - Default: "default"
      # Description: Deployment job
      # github-releases.pushJobName = "default";

      ## Repository Metadata (Read-only)
      # Provided by Hercules CI at runtime

      # repo.ref - Type: string (read-only)
      # Example: "refs/heads/main"

      # repo.rev - Type: string (read-only)
      # Example: "17ae1f614017447a983c34bb046892b3c571df52"

      # repo.shortRev - Type: string (read-only)
      # Example: "17ae1f6"

      # repo.branch - Type: null or string (read-only)
      # Example: "main"

      # repo.tag - Type: null or string (read-only)
      # Example: "1.0"

      # repo.owner - Type: string (read-only)
      # Repository owner identifier

      # repo.name - Type: string (read-only)
      # Repository name

      # repo.forgeType - Type: string (read-only)
      # Example: "github" or "gitlab"

      # repo.remoteHttpUrl - Type: string (read-only)
      # HTTPS clone URL

      # repo.remoteSshUrl - Type: string (read-only)
      # SSH clone URL

      # repo.webUrl - Type: string (read-only)
      # Browser-accessible URL

      ## Job Scheduling (requires agent 0.9.8+)
      # Time-based job triggers

      # onSchedule.<name> = {
      #   when = {
      #     minute = null;          # 0-59, null for any
      #     hour = null;            # 0-23, null for any
      #     dayOfMonth = null;      # 1-31, null for any
      #     dayOfWeek = null;       # ["Mon".."Sun"], null for any
      #   };
      #   outputs = {
      #     # builds or effects
      #   };
      # };

      ## Push Jobs
      # Standard push job with default behavior

      # onPush.default = {
      #   enable = true;  # Can be disabled
      #   outputs = {
      #     # attribute set of derivations
      #   };
      # };
      # The default job builds known flake outputs automatically across ciSystems
    };
  };

  perSystem = { config, pkgs, ... }: {
    # herculesCIEffects.pkgs - Type: raw value
    # Default: pkgs argument
    # Description: Custom nixpkgs for effects
    # herculesCIEffects.pkgs = pkgs;

    # hercules-ci.github-pages.settings - Type: module
    # Description: System-specific page deployment config
    # hercules-ci.github-pages.settings = { };
  };
}
