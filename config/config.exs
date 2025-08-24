import Config

config :tailwind,
  version: "4.1.12",
  modern_ui: [
    args: ~w(
      --input=assets/css/app.css
      --output=priv/static/css/app.css
    ),
    cd: Path.expand("..", __DIR__)
  ]

esbuild_config = fn args ->
  [
    args: ~w(./src/hooks --bundle) ++ args,
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]
end

config :esbuild,
  version: "0.25.4",
  module: esbuild_config.(~w(--format=esm --sourcemap --outfile=../priv/static/js/modern_ui.mjs)),
  main: esbuild_config.(~w(--format=cjs --sourcemap --outfile=../priv/static/js/modern_ui.cjs))
