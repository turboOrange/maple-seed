defmodule Mapleseed.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MapleseedWeb.Telemetry,
      Mapleseed.Repo,
      {DNSCluster, query: Application.get_env(:mapleseed, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Mapleseed.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Mapleseed.Finch},
      # Start a worker by calling: Mapleseed.Worker.start_link(arg)
      # {Mapleseed.Worker, arg},
      # Start to serve requests, typically the last entry
      MapleseedWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mapleseed.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MapleseedWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
