defmodule Pid.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias Pid.ControllerAgent

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Pid.Worker.start_link(arg)
      # {Pid.Worker, arg}
      ControllerAgent
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pid.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
