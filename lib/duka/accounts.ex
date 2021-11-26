defmodule Duka.Accounts do
  alias Duka.Users.User
  alias Duka.Repo

  def get_user(id) do
    Repo.get!(User, id)
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def get_user_by(params) do
    Repo.get_by!(User, params)
  end

  def authenticate_by_email_and_pass(email, given_pass) do

    user = get_user_by(email: email)
    cond do
      user && Pbkdf2.verify_pass(given_pass, user.password_hash) ->
        {:ok, user}
      user ->
        {:error, :unathorized}
      true ->
        Pbkdf2.no_user_verify()
        {:error, :not_found}
    end
  end

  def change_registration(%User{} =user, params) do
    User.registration_changeset(user, params)
  end

  def register_user(attrs \\ %{}) do

    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert!()

  end
end
