defmodule RiotDeveloperClient.Account do
  import RiotDeveloperClient.Client

  alias RiotDeveloperClient.Helper.Json

  def get_account_data(name, tag_name) do
    url = "riot/account/v1/accounts/by-riot-id/#{name}/#{tag_name}"

    case Tesla.get(client(), url) do
      {:ok, %Tesla.Env{status: 200, body: body}} ->
        Json.convert_to_atom_map(body)

      response ->
        response
    end
  end
end