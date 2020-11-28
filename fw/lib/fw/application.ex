defmodule Fw.Application do
  @moduledoc false


  use Application

  def start(_type, _args) do
    stop_fan(target())

    opts = [strategy: :one_for_one, name: Fw.Supervisor]

    children =
      [
        # Children for all targets
        # Starts a worker by calling: Fw.Worker.start_link(arg)
        # {Fw.Worker, arg},
      ] ++ children(target())

    Supervisor.start_link(children, opts)
  end

  # List all child processes to be supervised
  def children(:host) do
    [
      Fw.Adapters.SpiTest,
      Fw.Temperature
    ]
  end

  def children(_target) do
    [
      Fw.Temperature
    ]
  end

  def target() do
    Application.get_env(:fw, :target)
  end

  # PWM fans run when there is no voltage on the PWM pin
  # Need to stop the running fan when the app starts
  defp stop_fan(:host), do: :ok

  defp stop_fan(_env), do: Fw.Fan.stop
end
