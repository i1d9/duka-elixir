defmodule Duka.Businesses do

  alias Duka.Repo
  alias Duka.Businesses.Business

  def list_businesses do
    Repo.all(Business)
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
