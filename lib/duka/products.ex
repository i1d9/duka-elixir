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

  def delete_product do

  end

  def update_product do

  end
end
