defmodule RiotDeveloperClientTest do
  use ExUnit.Case
  doctest RiotDeveloperClient

  test "greets the world" do
    assert RiotDeveloperClient.hello() == :world
  end
end
