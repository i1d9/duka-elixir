defmodule DukaWeb.UserController do
  use DukaWeb, :controller
  alias Duka.Users
  alias Duka.Users.User


  def login(conn, _params) do
    changeset = Users.User.changeset(%User{})
    render conn, "login.html", changeset: changeset
  end


  def new(conn, _params) do
    changeset = Duka.Accounts.change_registration(%User{}, %{})
    render conn, "register.html", changeset: changeset
  end

  def delete(conn, _)do
    conn
    |> DukaWeb.Auth.logout()
    |> redirect(external: Routes.duka_url(conn, :index))
  end




end
