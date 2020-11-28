import Config

config :fw, Fw.Temperature,
  spi_adapter: Fw.Adapters.SpiTest

config :fw, Fw.Fan,
  pwm_adapter: Fw.Adapters.PwmTest,
  pwm_pin: 18,
  pwm_frequency: 25_000,
  pwm_frequency_multiplier: 1000

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ui, UiWeb.Endpoint,
  http: [url: "localhost", port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
