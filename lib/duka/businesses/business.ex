defmodule Duka.Businesses.Business do
  use Ecto.Schema
  import Ecto.Changeset

  schema "businesses" do

    field :name, :string
    field :description, :string
    field :category, :string
    has_many :products, Duka.Businesses.Products.Product
    belongs_to :user, Duka.Users.User
    timestamps()
  end


  def changeset(business, params \\ %{}) do
    business
    |> cast(params, [:name, :category, :description])
    |> validate_required([:name, :category, :description])
    |> validate_length(:name, min: 3)
    |> validate_length(:description, min: 8)
    |> validate_exclusion(:name, ~w(admin superadmin duka home about contact careers phone blog login logout account business))
    |> unique_constraint(:name)
  end
  
end
