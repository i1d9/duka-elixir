defmodule Duka.Businesses.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do

    field :name, :string
    field :description, :string
    field :category, :string
    field :price, :integer
    belongs_to :business, Duka.Businesses.Business

    timestamps()
  end

  def changeset(product, params \\ %{}) do
    product
    |> cast(params, [:name, :category, :description, :price])
    |> validate_required([:name, :category, :description, :price])
    |> unique_constraint(:name)
  end
  
end
