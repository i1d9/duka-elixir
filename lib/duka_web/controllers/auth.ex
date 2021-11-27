defmodule DukaWeb.Auth do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    user = user_id && Duka.Accounts.get_user(user_id)
    assign(conn, :current_user, user)
  end

  def login(conn, user) do
    IO.inspect(user)
    
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  def logout(conn) do
    configure_session(conn, drop: true)
  end

  import Phoenix.Controller
  alias DukaWeb.Router.Helpers, as: Routes
  @doc """
  if the current_user is in the connection return the connection downstream
  else redirect to another page
  halt() stops downstream transformation
  """
  def authenticate_user(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: Routes.duka_path(conn, :index))
      |> halt()
    end
  end

end
