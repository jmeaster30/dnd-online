defmodule DndOnline.Routers.ApiRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  match "*path" do
    send_resp(conn, 200, "This path called #{path}")
  end

end
