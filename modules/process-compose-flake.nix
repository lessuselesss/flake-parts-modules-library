# process-compose-flake flake-parts module
# https://flake.parts/options/process-compose-flake
#
# Declares process-compose configurations using Nix attribute sets,
# generating packages that wrap the process-compose binary for managing
# multi-process applications.
#
# Usage:
#   Add to your flake inputs:
#     process-compose-flake.url = "github:Platonic-Systems/process-compose-flake";
#
#   Then import this module:
#     imports = [ ./modules/process-compose-flake.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.process-compose-flake.flakeModule
  ];

  perSystem = { config, pkgs, ... }: {
    # Process-compose configurations
    # Type: attribute set of submodule
    # Description: Creates process-compose executables from Nix configurations
    process-compose = {
      # example = {
        ## Core Configuration

        # package - Type: package - Default: pkgs.process-compose
        # Description: The process-compose package to bundle
        # package = pkgs.process-compose;

        ## CLI Configuration

        # cli.environment - Type: submodule - Default: { }
        # Description: Environment variables for process-compose CLI
        # cli.environment = {
        #   PC_DISABLE_TUI = true;  # Disable text user interface
        # };

        # cli.options - Type: submodule - Default: { }
        # Available options:
        # cli.options = {
        #   log-file = "/tmp/process-compose.log";
        #   no-server = false;
        #   ordered-shutdown = true;
        #   port = 8080;              # API server port
        #   read-only = false;
        #   unix-socket = null;
        #   use-uds = false;          # Use Unix domain socket
        # };

        # cli.hooks - Commands to execute before/after process-compose
        # cli.hooks.preHook = ''
        #   echo "Starting processes..."
        # '';
        # cli.hooks.postHook = ''
        #   echo "Processes stopped"
        # '';

        ## Settings Configuration

        # settings - Type: submodule - Default: { }
        # Description: Core configuration for processes, environment, and logging
        # settings = {
          ## Global Settings

          # version - Type: null or string - Configuration format version
          # version = "0.5";

          # log_level - Type: null or one of: "trace", "debug", "info", "warn", "error", "fatal", "panic"
          # log_level = "info";

          # log_location - Type: null or string - Log file path
          # log_location = "/tmp/process-compose.log";

          # log_length - Type: null or unsigned integer
          # log_length = 1000;

          # shell.shell_command - Type: string - Default: ${pkgs.bash}/bin/bash
          # shell.shell_argument - Type: string - Default: "-c"

          ## Processes Configuration

          # processes - Type: attribute set of submodule
          # Description: Maps process names to configurations
          # processes = {
          #   web-server = {
          #     ## Required
          #     command = "${pkgs.python3}/bin/python -m http.server 8000";

          #     ## Process Control
          #     disabled = false;          # Disable process startup
          #     is_daemon = false;         # Background service
          #     is_foreground = false;     # Requires full terminal
          #     is_tty = false;            # Simulate TTY mode
          #     working_dir = "/tmp";      # Working directory

          #     ## Environment
          #     environment = {
          #       PORT = "8000";
          #     };

          #     ## Availability
          #     restart = "on_failure";    # Options: "always", "on_failure", "exit_on_failure", "no"
          #     max_restarts = 3;
          #     backoff_seconds = 5;
          #     exit_on_end = false;
          #     exit_on_skipped = false;

          #     ## Health Checks
          #     readiness_probe = {
          #       http_get = {
          #         host = "localhost";
          #         port = 8000;
          #         path = "/";
          #         scheme = "http";
          #       };
          #       initial_delay_seconds = 2;
          #       period_seconds = 10;
          #       timeout_seconds = 3;
          #       success_threshold = 1;
          #       failure_threshold = 3;
          #     };

          #     # liveness_probe = {
          #     #   exec.command = "curl -f http://localhost:8000";
          #     #   period_seconds = 30;
          #     # };

          #     ## Shutdown
          #     shutdown = {
          #       command = null;          # Graceful shutdown command
          #       signal = 15;             # SIGTERM
          #       timeout_seconds = 10;
          #     };
          #   };

          #   database = {
          #     command = "${pkgs.postgresql}/bin/postgres -D /tmp/pgdata";
          #     is_daemon = true;
          #     depends_on.web-server.condition = "process_healthy";
          #   };
          # };
        # };

        ## Output Options (Read-only)

        # outputs.package - Type: package
        # Description: Final package executing 'process-compose up'

        # outputs.testPackage - Type: null or package
        # Description: Package including designated test process

        # outputs.check - Type: null or package - Default: null
        # Description: CI-oriented package with enabled test process
      # };
    };
  };
}
