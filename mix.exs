defmodule McFeely.MixProject do
  use Mix.Project

  def project do
    [
      app: :mcfeely,
      version: "0.1.0",
      elixir: "~> 1.10",
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
      {:hackney, "~> 1.9"},
      {:swoosh, git: "https://github.com/guildflow/swoosh.git", branch: "postmark-updates"},

      # Used to parse Markdown content
      {:earmark, "~> 1.3"},

      # Used to sanatize HTML from Markdown content
      # https://github.com/rrrene/html_sanitize_ex
      {:html_sanitize_ex, "~> 1.4.1"}
    ]
  end
end
