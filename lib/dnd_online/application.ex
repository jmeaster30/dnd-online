defmodule DndOnline.Application do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      DndOnline.Database.Repo,
      {Plug.Cowboy, scheme: :http, plug: DndOnline.Routers.Router, options: [port: get(:port, 8080)]}
    ]

    opts = [strategy: :one_for_one, name: DndOnline.Supervisor]
    Logger.info("Starting application...")
    Logger.info(inspect children)
    Supervisor.start_link(children, opts)
  end

  defp get(s, default_value), do: Application.get_env(:dnd_online, s, default_value)
end
