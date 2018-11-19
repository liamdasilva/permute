defmodule Permute.MixProject do
  use Mix.Project

  def project do
    [
      app: :permute,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:flow, "~> 0.14"},
      {:benchee, "~> 0.11", only: [:dev, :test]},
      {:benchee_html, "~> 0.4", only: :dev}
    ]
  end
end
