defmodule Duka.Products do

  alias Duka.Businesses.Business
  alias Duka.Businesses.Products.Product
  alias Duka.Repo
  import Ecto.Query


  def create_product(business, attrs \\ %{}) do
    business
    |> Ecto.build_assoc(:products)
    |> Product.changeset(attrs)
    |> Repo.insert!()
  end

  def delete_product(%Product{} = product) do
    Repo.delete!(product)
  end

  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update!()
  end

  def get_product(id) do
    Repo.get(Product, id)
  end
  
end
