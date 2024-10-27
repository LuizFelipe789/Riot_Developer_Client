defmodule RiotDeveloperClient.ApiClient do
  @moduledoc false

  def client do
    middleware = [
      {Tesla.Middleware.BaseUrl, base_url()},
      {Tesla.Middleware.Headers, [{"X-Riot-Token", api_key()}]},
      {Tesla.Middleware.JSON, engine: Jason, engine_opts: [keys: :atoms]}
    ]

    Tesla.client(middleware, adapter())
  end

  defp adapter do
    Application.get_env(:riot_developer_client, __MODULE__)[:adapter]
  end

  defp api_key do
    Application.get_env(:riot_developer_client, __MODULE__)[:api_key]
  end

  defp base_url do
    Application.get_env(:riot_developer_client, __MODULE__)[:base_url]
  end
end
