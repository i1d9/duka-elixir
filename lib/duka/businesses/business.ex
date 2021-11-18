defmodule Duka.Businesses.Business do
  use Ecto.Schema


  schema "businesses" do

    field :name, :string
    field :description, :string
    field :category, :string

    has_many :products, Duka.Businesses.Products.Product
    belongs_to :user, Duka.Users.User


    timestamps()
  end
end
