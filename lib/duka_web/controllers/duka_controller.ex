defmodule DukaWeb.DukaController do
  use DukaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
