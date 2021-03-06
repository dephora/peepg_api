defmodule PeepgApi.Mixfile do
  use Mix.Project

  def project do
    [app: :peepg_api,
     version: "0.0.1",
     elixir: "~> 1.4.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {PeepgApi, []},
     applications: [:phoenix, :phoenix_pubsub, :cowboy, :logger, :gettext,
                    :phoenix_ecto, :postgrex, :absinthe, :absinthe_plug, :absinthe_ecto, :faker, :cors_plug, :timex,:timex_ecto, :ex_phone_number, :comeonin, :guardian ]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.2.1"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_ecto, "~> 3.0"},
     {:postgrex, ">= 0.0.0"},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:absinthe, "~> 1.2"},
     {:absinthe_plug, "~> 1.2"},
     {:absinthe_ecto, git: "https://github.com/absinthe-graphql/absinthe_ecto.git"},
     {:faker, git: "https://github.com/igas/faker.git"},
     {:cors_plug, "~> 1.2"},
     {:timex, "~> 3.0"},
     {:timex_ecto, "~> 3.0"},
     {:ex_phone_number, git: "https://github.com/socialpaymentsbv/ex_phone_number.git", branch: "develop"},
     {:guardian, "~> 0.14.2"},
     {:comeonin, "~> 3.0"}
  ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
