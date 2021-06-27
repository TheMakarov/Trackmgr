defmodule Trackmgr.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Trackmgr.Repo,
      # Start the Telemetry supervisor
      TrackmgrWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Trackmgr.PubSub},
      # Start the Endpoint (http/https)
      TrackmgrWeb.Endpoint
      # Start a worker by calling: Trackmgr.Worker.start_link(arg)
      # {Trackmgr.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Trackmgr.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TrackmgrWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
