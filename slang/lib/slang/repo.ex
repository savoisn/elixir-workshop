defmodule Slang.Repo do
  use Ecto.Repo,
    otp_app: :slang,
    adapter: Ecto.Adapters.Postgres
end
