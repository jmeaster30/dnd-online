defmodule DndOnline.Routers.Router do
  use Plug.Router

  plug Plug.Static, at: "/", from: :dnd_online
  plug :match
  plug :dispatch

  forward "/api", to: DndOnline.Routers.ApiRouter

  get _ do
    conn
    |> put_resp_content_type("text/html")
    |> send_file(200, "priv/static/index.html")
  end

  match _ do
    send_resp(conn, 404, ":(")
  end

end
