defmodule DndOnline.Database.Repo do
  use Ecto.Repo,
    otp_app: :dnd_online,
    adapter: Ecto.Adapters.Postgres
end
