defmodule Duka.Products do

  alias Duka.Businesses.Products.Product
  alias Duka.Repo
  def list_products do
    Repo.all(Product)
  end

  def list_business_products() do
    
  end

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
