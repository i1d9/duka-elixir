defmodule DukaWeb.UserController do
  use DukaWeb, :controller
  alias Duka.Repo




  def login(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "login.html", changeset: changeset
  end

  def sign_in(conn, %{"user" => %{"email" => email, "password" => given_password}}) do

    case Duka.Accounts.authenticate_by_email_and_pass(email, given_password) do
      {:ok, user} ->
        conn
        |> DukaWeb.Auth.login(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.duka_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid email/password combination")
        |> render("login.html")
    end
  end


  def new(conn, _params) do
    changeset = Duka.Accounts.change_registration(%User{}, %{})
    render conn, "register.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = Duka.Accounts.change_registration(%User{}, %{})
    case Duka.Accounts.register_user(user_params) do
      {:ok, user} ->

        """
        IO.inspect(user)
        conn
        |> DukaWeb.Auth.login(user)
        |> redirect(to: Routes.duka_path(conn, :index))
        """
        render conn, "register.html", changeset: changeset
      {:error, %Ecto.Changeset{} = changeset} ->
        render conn, "register.html", changeset: changeset
    end
  end

  def delete(conn, _)do
    conn
    |> DukaWeb.Auth.logout()
    |> redirect(to: Routes.duka_path(conn, :index))
  end

end
