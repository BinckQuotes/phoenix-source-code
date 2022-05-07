# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :binckquotes,
  ecto_repos: [Binckquotes.Repo]

# Configures the endpoint
config :binckquotes, BinckquotesWeb.Endpoint,
  # url: [host: "localhost"],
  url: [host: "https://binckquotes.gigalixirapp.com/"],
  render_errors: [view: BinckquotesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Binckquotes.PubSub,
  live_view: [signing_salt: "Wz+va4sD"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures Dart Sass (.scss/.sass compiler)
config :dart_sass,
  version: "1.49.11",
  default: [
    args: ~w(css/app.scss ../priv/static/assets/app.css),
    cd: Path.expand("../assets", __DIR__)
  ]

# Import environment specific config.
#! This must remain at the bottom of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
