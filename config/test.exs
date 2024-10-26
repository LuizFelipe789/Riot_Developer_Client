import Config

config :riot_developer_client, RiotDeveloperClient.ApiClient,
  adapter: Tesla.Mock,
  base_url: "https://mock.api.riotgames.com/",
  api_key: "API_KEY"
