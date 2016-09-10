# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :el_passsion_workshop_chat,
  ecto_repos: [ElPasssionWorkshopChat.Repo]

# Configures the endpoint
config :el_passsion_workshop_chat, ElPasssionWorkshopChat.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NhRdggo/mB0LZLiD9hsWD2JTVGlZ4vC8miqsRfG7Y1BUXq3mAWTaDlyWpcJsExNd",
  render_errors: [view: ElPasssionWorkshopChat.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElPasssionWorkshopChat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :hound, driver: "chrome_driver"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
