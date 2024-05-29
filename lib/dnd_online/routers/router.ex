defmodule DndOnline.Routers.Router do
  use Plug.Router
  use Plug.ErrorHandler
  require Logger

  plug Plug.Static, at: "/", from: :dnd_online
  plug :match
  plug :dispatch

  forward "/api", to: DndOnline.Routers.ApiRouter

  get _ do
    conn
    |> put_resp_content_type("text/html")
    |> send_file(200, "priv/static/index.html")
  end

  match "*path" do
    _ = conn
    raise DndOnline.Exceptions.NotFound, message: "'#{inspect path}' not found"
  end

  defp handle_errors(conn, %{kind: kind, reason: reason, stack: stack}) do
    IO.inspect(kind, label: :kind)
    IO.inspect(reason, label: :reason)
    IO.inspect(stack, label: :stack)
    send_resp(conn, conn.status, "Something went wrong")
  end
end
