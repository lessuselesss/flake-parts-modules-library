# services-flake flake-parts module
# https://github.com/juspay/services-flake
#
# Provides NixOS-like services for Nix development environments.
# Declarative, composable, and reproducible service management based on flake-parts.
#
# Usage:
#   Add to your flake inputs:
#     services-flake.url = "github:juspay/services-flake";
#
#   Then import this module:
#     imports = [ ./modules/services-flake.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.services-flake.flakeModule
  ];

  perSystem = { config, pkgs, ... }: {
    # Services configuration
    # Type: attribute set of submodule
    #
    # Available services include:
    # - postgres: PostgreSQL database
    # - mysql: MySQL/MariaDB database
    # - redis: Redis cache/database
    # - elasticsearch: Elasticsearch search engine
    # - nginx: Nginx web server
    # - cassandra: Apache Cassandra database
    # - clickhouse: ClickHouse analytical database
    # - zookeeper: Apache ZooKeeper coordination service
    # - kafka: Apache Kafka message broker
    # - grafana: Grafana monitoring
    # - prometheus: Prometheus monitoring
    # - vault: HashiCorp Vault secrets management
    # - ollama: Ollama LLM runtime
    # - And many more...
    #
    # Example configuration:
    # services.postgres."pg1" = {
    #   enable = true;
    #   listen_addresses = "127.0.0.1";
    #   port = 5432;
    #   initialDatabases = [
    #     { name = "mydb"; }
    #   ];
    # };
    #
    # services.redis."redis1" = {
    #   enable = true;
    #   port = 6379;
    # };
    #
    # Access services in devShell with:
    # process-compose-<name>    - Start all services
    # services-flake-<name>     - Manage individual services
  };
}
