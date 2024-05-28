defmodule DndOnline.Application do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: DndOnline.Routers.Router, options: [port: 8080]}
    ]

    opts = [strategy: :one_for_one, name: DndOnline.Supervisor]
    Logger.info("Starting application...")
    Supervisor.start_link(children, opts)
  end
end
