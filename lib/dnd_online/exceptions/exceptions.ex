defmodule DndOnline.Exceptions.TestError do
  defexception message: "whoops", plug_status: 500
end

defmodule DndOnline.Exceptions.ServerError do
  defexception message: "", plug_status: 500
end

defmodule DndOnline.Exceptions.NotFound do
  defexception message: "", plug_status: 404
end

defmodule DndOnline.Exceptions.NotImplemented do
  defexception message: "", plug_status: 501
end
