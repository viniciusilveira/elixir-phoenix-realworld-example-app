defmodule RealWorld.Mixfile do
  use Mix.Project

  def project do
    [
      app: :real_world,
      version: "1.0.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],

      # Docs
      name: "RealWorld",
      source_url: "https://github.com/gothinkster/elixir-phoenix-realworld-example-app",
      homepage_url: "https://github.com/gothinkster/elixir-phoenix-realworld-example-app",
      # The main page in the docs
      docs: [main: "README", extras: ["README.md"]]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {RealWorld.Application, []}, extra_applications: [:logger, :runtime_tools, :comeonin]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support", "test/factories"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_live_dashboard, "~> 0.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.5"},
      {:postgrex, "~> 0.15.9"},
      {:gettext, "~> 0.18"},
      {:proper_case, "~> 1.0.0"},
      {:cowboy, "~> 2.5"},
      {:plug_cowboy, "~> 2.1"},
      {:comeonin, "~> 3.2"},
      {:guardian, "~> 1.0"},
      {:excoveralls, "~> 0.7", only: [:dev, :test]},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:ex_machina, "~> 2.7", only: :test},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      {:plug, "~> 1.0"},
      {:corsica, "~> 1.0"},
      {:jason, "~> 1.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
