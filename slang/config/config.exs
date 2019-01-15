# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :slang,
  ecto_repos: [Slang.Repo]

# Configures the endpoint
config :slang, SlangWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LEXECj/jowYAW+HPipR74yN3EIeSBYRA8zwzuxSfjFb5/HlgCL6CkIzv7JYGHSwE",
  render_errors: [view: SlangWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Slang.PubSub, adapter: Phoenix.PubSub.PG2]


# Guardian config
config :slang, Slang.Guardian,
       issuer: "slang",
       secret_key: "a2rLR0uj4W1nQ3h3kTCONdx/jGtKlnrHvu0AUv7EwLLthDFTvsjXNL3SRZbPd7x/<Paste>"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
