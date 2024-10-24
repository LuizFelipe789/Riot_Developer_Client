defmodule RiotDeveloperClient.Client do
  def client do
    base_url = Application.get_env(:riot_developer_client, __MODULE__)[:base_url]
    api_key = Application.get_env(:riot_developer_client, __MODULE__)[:api_key]

    middleware = [
      {Tesla.Middleware.BaseUrl, base_url},
      {Tesla.Middleware.Headers, [{"X-Riot-Token", api_key}]}
    ]

    Tesla.client(middleware)
  end
end
