defmodule DukaWeb.Subdomain.ProductController do
  use DukaWeb, :controller

  alias Duka.Businesses

  def index(conn, _params) do


    if Businesses.get_business_by_name(conn.private[:subdomain]) do
      text(conn, "Subdomain home page for #{conn.private[:subdomain]}")
    else
        redirect(conn, external: Routes.duka_url(conn, :index))
    end

  end

  def detail(conn, %{"id" => id}) do
    IO.inspect(id)
    text(conn, "Subdomain home page for #{conn.private[:subdomain]}")
  end
end
