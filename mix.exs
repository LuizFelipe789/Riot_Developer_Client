defmodule RiotDeveloperClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :riot_developer_client,
      version: "0.1.0",
      elixir: "~> 1.17",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["test/support", "lib"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:jason, "~> 1.4"},
      {:tesla, "~> 1.12.1"},
      {:hackney, "> 1.0.0"},
      {:credo, "~> 1.7", only: [:dev, :test]}
    ]
  end
end
