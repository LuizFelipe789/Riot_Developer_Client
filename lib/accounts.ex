defmodule RiotDeveloperClient.Account do
  import RiotDeveloperClient

  def get_account_data(name, tag_name) do
    url = "riot/account/v1/accounts/by-riot-id/#{name}/#{tag_name}"

    case Tesla.get(client(), url) do
      {:ok, %Tesla.Env{status: 200, body: body}} ->
        body

      response ->
        response
    end
  end
end
