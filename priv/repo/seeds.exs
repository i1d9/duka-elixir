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
alias Duka.Businesses.{Business, Products, Products.Product}
alias Duka.Users
alias Duka.Users.User
alias Duka.Repo

user_one = %{first_name: "i1d9", second_name: "i1d9", email: "email@email.com", phone: "+254712345678", password: "email@email.com", password_confirmation: "email@email.com"}
user_changeset = User.registration_changeset(%User{}, user_one)
#user_one = Repo.insert!(user_changeset)

case Duka.Accounts.register_user(user_one) do
  {:ok, %Users.User{} = user_one} ->
    user_one
    IO.inspect()
  {:error, user_changeset} ->
    user_changeset
end


"""


def create_business(user) do
  business_params = %{name: "flesdjkdsjka", description: "all in one shop for everything", category: "lmao"}
  business_one = Ecto.build_assoc(user,:business)
  business_changeset =
    Ecto.build_assoc(user,:business)
    |> Business.changeset(business_params)
  business_one = Repo.insert!(business_changeset)
end

#Repo.insert!(business_changeset) do
#  {:ok, business_one} ->
#    business_one
#  {:error, business_changeset} ->
#    business_changeset
#end

business = Repo.get!(Business, 2)

def create_products(business) do
  for i <- 1..10 do
    product_detail = %{
    name: "Product #i}",
    description: "Bitstring generators are also supported and are very useful when you need to comprehend over bitstring streams. The example below receives a list of pixels from a binary with their respective red, green and blue values and converts them into tuples of three elements each",
    category: "shoes",
    price: 5
    }
    business
    |> Ecto.build_assoc(:products)
    |> Product.changeset(attrs)
    |> Repo.insert!()
  end
end

for i <- 1..10 do
  product_detail = %{
  name: "Product #i}",
  description: "Bitstring generators are also sup",
  category: "shoes",
  price: 5
  }

  business
  |> Ecto.build_assoc(:products)
  |> Product.changeset(product_detail)
  |> Repo.insert!()
end

product_detail = %{
  name: "Product",
  description: "Bitstring generators are also sup",
  category: "shoes",
  price: 5
  }

"""
