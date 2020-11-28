import Config
config :fw, Fw.Temperature,
  spi_adapter: Fw.Adapters.SpiTest

config :fw, Fw.Fan,
  pwm_adapter: Fw.Adapters.PwmTest,
  pwm_pin: 18,
  pwm_frequency: 25_000,
  pwm_frequency_multiplier: 1

# For development of the firmware with the Phoenix server running.

# This is used when running the firmware application in iex.
#   MIX_TARGET=host MIX_ENV=dev iex -S mix
config :ui, UiWeb.Endpoint,
  url: [host: "localhost"],
  http: [port: 4000]


# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
