# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :peepg_api,
  ecto_repos: [PeepgApi.Repo]

# Configures the endpoint
config :peepg_api, PeepgApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jG8tPziOSJ/xWLynwQHY1BDAWmstMhL954qL6QQAQaxwEJhJghHLn73G+5rCMTe0",
  render_errors: [view: PeepgApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: PeepgApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
