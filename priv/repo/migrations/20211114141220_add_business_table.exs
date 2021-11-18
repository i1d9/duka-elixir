defmodule Duka.Repo.Migrations.AddBusinessTable do
  use Ecto.Migration

  def change do
    create table(:businesses) do
      add :name, :string, null: false
      add :description, :string
      add :category, :string
      add :user_id, references(:users)

      timestamps()
    end
    create unique_index(:businesses, [:name])
  end
end
