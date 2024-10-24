import Config

config :riot_developer_client, RiotDeveloperClient.Client,
  base_url: System.get_env("BASE_URL"),
  api_key: System.get_env("API_KEY")
