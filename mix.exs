defmodule ModernUI.MixProject do
  use Mix.Project

  def project do
    [
      app: :modern_ui,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      package: package(),
      description: description()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    "A collection of components for Phoenix LiveView."
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:esbuild, "~> 0.10", runtime: Mix.env() == :dev},
      {:gettext, "~> 0.26", runtime: Mix.env() == :dev},
      {:phoenix_live_view, "~> 1.1.0", runtime: Mix.env() == :dev},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:materialdesignicons,
       github: "Templarian/MaterialDesign",
       sparse: "svg",
       app: false,
       compile: false,
       depth: 1,
       only: [:dev, :test],
       runtime: false},
      {:tailwind, "~> 0.3", runtime: Mix.env() == :dev}
    ]
  end

  defp package do
    [
      maintainers: ["Eugene Cheltsov"],
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => "https://github.com/ChillyBwoy/modern_ui"
      },
      files: ~w(lib priv assets/css assets/vendor mix.exs README.md)
    ]
  end

  defp aliases do
    [
      setup: ["assets.setup", "assets.build"],
      "assets.setup": ["tailwind.install --if-missing", "esbuild.install --if-missing"],
      "assets.build": ["tailwind modern_ui", "esbuild module", "esbuild main"],
      "assets.watch": ["esbuild module --watch"]
    ]
  end
end
