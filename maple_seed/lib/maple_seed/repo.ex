defmodule MapleSeed.Repo do
  use Ecto.Repo,
    otp_app: :maple_seed,
    adapter: Ecto.Adapters.Postgres
end
