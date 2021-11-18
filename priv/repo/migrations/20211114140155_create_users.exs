defmodule Duka.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string, null: false
      add :second_name, :string, null: false
      add :phone, :string, null: false
      add :email, :string, null: false
      add :password_hash, :string, redact: true

      timestamps()
    end

    create unique_index(:users, [:email, :phone])
  end
end
