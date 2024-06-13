import Config

config :dnd_online,
  port: 3000

config :dnd_online, DndOnline.Database.Repo,
  database: "dnd_online_repo",
  username: "dev",
  password: "password",
  hostname: "localhost",
  port: 5432
