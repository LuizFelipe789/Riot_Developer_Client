defmodule RiotDeveloperClient do
  use Tesla

  import RiotDeveloperClient.ApiClient

  def get_account_data_by_name_and_tag_name(name, tag_name) do
    get(client(), "riot/account/v1/accounts/by-riot-id/#{name}/#{tag_name}")
    |> handle_response()
  end

  def get_account_data_by_puuid(puuid) do
    get(client(), "riot/account/v1/accounts/by-puuid/#{puuid}")
    |> handle_response()
  end

  defp handle_response({:ok, %Tesla.Env{status: 200, body: body_response}}) do
    {:ok,
     %{
       puuid: body_response.puuid,
       name: body_response.gameName,
       tag_name: body_response.tagLine
     }}
  end

  defp handle_response({:ok, %Tesla.Env{status: 403}}), do: {:error, "Forbidden"}
  defp handle_response({:ok, %Tesla.Env{status: 401}}), do: {:error, "Unauthorized"}
  defp handle_response({:ok, %Tesla.Env{status: 404}}), do: {:error, "Not Found"}
  defp handle_response({:ok, %Tesla.Env{status: 429}}), do: {:error, "Rate Limit Exceeded"}
  defp handle_response({:ok, %Tesla.Env{status: 500}}), do: {:error, "Internal Server Error"}

  defp handle_response({:ok, %Tesla.Env{status: status, body: response}}) do
    {:error, "Unexpected error, status: #{status}, response: #{response}"}
  end
end
