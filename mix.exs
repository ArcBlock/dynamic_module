defmodule DynamicModule.MixProject do
  use Mix.Project

  @version File.cwd!() |> Path.join("version") |> File.read!() |> String.trim()
  @elixir_version File.cwd!() |> Path.join(".elixir_version") |> File.read!() |> String.trim()

  def project do
    [
      app: :dynamic_module,
      version: @version,
      elixir: @elixir_version,
      description: description(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),

      # Docs
      name: "Goldorin",
      source_url: "https://github.com/ArcBlock/goldorin",
      homepage_url: "https://github.com/ArcBlock/goldorin",
      docs: [
        main: "Goldorin",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:recase, "~> 0.3"}
    ]
  end

  defp description do
    """
    Generate modules with given data.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*", "version", ".elixir_version"],
      licenses: ["MIT"],
      maintainers: ["tyr.chen@gmail.com"],
      links: %{
        "GitHub" => "https://github.com/ArcBlock/dynamic_module",
        "Docs" => "https://hexdocs.pm/dynamic_module"
      }
    ]
  end
end
