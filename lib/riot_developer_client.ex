defmodule RiotDeveloperClient do
  def client do
    middleware = [
      {Tesla.Middleware.BaseUrl, base_url()},
      {Tesla.Middleware.Headers, [{"X-Riot-Token", api_key()}]},
      {Tesla.Middleware.JSON, engine: Jason, engine_opts: [keys: :atoms]}
    ]

    Tesla.client(middleware)
  end

  defp api_key do
    Keyword.fetch!(config(), :api_key)
  end

  defp base_url do
    Keyword.fetch!(config(), :base_url)
  end

  defp config do
    Application.get_env(:riot_developer_client, __MODULE__)
  end
end
