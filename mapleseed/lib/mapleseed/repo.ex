defmodule Mapleseed.Repo do
  use Ecto.Repo,
    otp_app: :mapleseed,
    adapter: Ecto.Adapters.Postgres
end
