defmodule Duka.Repo do
  use Ecto.Repo,
    otp_app: :duka,
    adapter: Ecto.Adapters.Postgres
end
