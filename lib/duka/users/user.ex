defmodule Duka.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do

    field :first_name, :string
    field :second_name, :string
    field :phone, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :password_confirmation, :string, virtual: true
    has_one :business, Duka.Businesses.Business

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_length(:password, min: 8)
    |> validate_format(:email, ~r/^[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
  end

  def registration_changeset(user, params \\ %{}) do
    user
    |> changeset(params)
    |> validate_required([:first_name, :second_name, :phone,])
  end
end
