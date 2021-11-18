defmodule DukaWeb.Subdomain.ProductController do
  use DukaWeb, :controller

  def index(conn, _params) do
    if conn.private[:subdomain] do
      IO.inspect(conn.private[:subdomain])
      text(conn, "Subdomain home page for #{conn.private[:subdomain]}")
    else
      redirect(conn,to: Routes.duka_path(conn, :index))
    end
  end
end
