defmodule RiotDeveloperClient.Helper.Json do
  def convert_to_atom_map(string) do
    for {key, val} <- Jason.decode!(string), into: %{} do
      {String.to_atom(key), val}
    end
  end
end
