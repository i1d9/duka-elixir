# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Duka.Repo.insert!(%Duka.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Duka.Businesses.Business
alias Duka.Businesses.Products
alias Duka.Users
alias Duka.Users.User
alias Duka.Repo

user_one = %{first_name: "i1d9", second_name: "i1d9", email: "email@email.com", phone: "+254712345678", password: "email@email.com", password_confirmation: "email@email.com"}
user_changeset = User.changeset(%User{}, user_one)

Repo.insert!(user_changeset) do
  {:ok, user_one} ->
    user_one
  {:error, user_changeset} ->
    user_changeset
end

business_one = %{name: "flea", description: "all in one shop for everything", category: "lmao"}
business_changeset = Business.changeset(%Business{}, business_one)

Repo.insert!(business_changeset) do
  {:ok, business_one} ->
    business_one
  {:error, business_changeset} ->
    business_changeset
end
