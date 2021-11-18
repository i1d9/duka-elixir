defmodule Duka.Users.User do
  use Ecto.Schema


  schema "users" do

    field :first_name, :string
    field :second_name, :string
    field :phone, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_one :business, Duka.Businesses.Business

    timestamps()
  end
end
