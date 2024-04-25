defmodule ProdopsEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :prodops_ex,
      version: "0.1.0",
      elixir: "~> 1.16",
      deps: deps(),
      aliases: aliases(),

      # Docs
      name: "ProdopsEx",
      source_url: "https://github.com/revelrylabs/prodops_ex",
      docs: [
        main: "ProdopsEx",
        logo: "prodops-logo.png",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp aliases do
    [docs: ["docs", &copy_logo/1]]
  end

  defp copy_logo(_) do
    File.cp!("./prodops-logo.png", "./doc/prodops-logo.png")
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.29", only: [:dev, :test], runtime: false},
      {:httpoison, "~> 2.2"},
      {:jason, "~> 1.2"},
      {:styler, "~> 0.7", only: [:dev, :test], runtime: false}
    ]
  end
end
