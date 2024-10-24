defmodule RiotDeveloperClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :riot_developer_client,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 2.2.1"},
      {:jason, "~> 1.4"},
      {:tesla, "~> 1.12.1"}
    ]
  end
end
