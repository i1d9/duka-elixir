defmodule DukaWeb.Subdomain.ProductController do
  use DukaWeb, :controller

  alias Duka.Businesses
  plug :get_valid_business when action in [:index, :show]

  defp get_valid_business(conn, _opts) do
    if business = Businesses.get_business_by_name(conn.private[:subdomain]) do
      conn
      |> assign(:business, business)
    else
      redirect(conn, external: Routes.duka_url(conn, :index))
    end
  end

  def index(conn, _params) do
      text(conn, "Subdomain home page for #{conn.private[:subdomain]}")
  end

  def show(conn, %{"id" => id}) do
    IO.inspect(id)
    text(conn, "Subdomain home page for #{conn.private[:subdomain]}")
  end
end
