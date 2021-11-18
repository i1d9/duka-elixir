defmodule Duka.Businesses.Products.Product do
  use Ecto.Schema


  schema "products" do

    field :name, :string
    field :description, :string
    field :category, :string
    field :price, :integer
    belongs_to :business, Duka.Businesses.Business

    timestamps()
  end
end
