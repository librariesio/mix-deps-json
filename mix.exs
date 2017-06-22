defmodule Mixup.Mixfile do
  use Mix.Project

  def project do
    [app: :mixup,
     version: "0.0.1",
     elixir: "~> 1.4.4",
     deps: deps(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :cowboy, :plug]]
  end

  # defp escript_config do
  #   [main_module: Servelet]
  # end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:poison, "~> 3.1.0"},
      {:plug, "~> 1.3.0"},
      {:cowboy, "~> 1.1.0"},
      {:credo, "~> 0.5", only: [:dev, :test]},
      {:inch_ex, "~> 0.5", only: :docs}
    ]
  end
end
