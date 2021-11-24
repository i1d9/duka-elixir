defmodule Duka.Businesses do

  alias Duka.Repo
  alias Duka.Businesses.Business


  def get_business_by_name(name) when is_binary(name) do
    Repo.get_by(Business, name: name)
  end

  def list_businesses do
    Repo.all(Business)
  end

  def list_products(business) do
    Repo.all Ecto.assoc(business, :products)
  end

  def update_business(%Business{} = business, attrs) do
    business
    |> Business.changeset(attrs)
    |> Repo.update!()
  end

  def create_business(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:business)
    |> Business.changeset(attrs)
    |> Repo.insert!()
  end

  def delete_business(%Business{} = business) do
    Repo.delete!(business)
  end

end
