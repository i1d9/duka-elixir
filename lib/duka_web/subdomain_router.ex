defmodule DukaWeb.SubdomainRouter do
  use DukaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {DukaWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug DukaWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DukaWeb do
    pipe_through :browser
    get "/", Subdomain.ProductController, :index
    get "/item/:id", Subdomain.ProductController, :detail
  end

end
