import Config

config :tesla, :adapter, Tesla.Adapter.Mint

config :riot_developer_client, RiotDeveloperClient.ApiClient,
  base_url: System.fetch_env("BASE_URL"),
  api_key: System.fetch_env("API_KEY")

import_config "#{config_env()}.exs"
