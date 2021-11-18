defmodule Duka.Repo.Migrations.AddBusinessProductsTable do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string, null: false
      add :description, :string
      add :category, :string
      add :price, :integer
      add :business_id, references(:businesses)

      timestamps()
    end
    create unique_index(:products, [:name])
  end
end
