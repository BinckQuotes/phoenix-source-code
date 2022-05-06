defmodule Binckquotes.Repo do
  use Ecto.Repo,
    otp_app: :binckquotes,
    adapter: Ecto.Adapters.Postgres
end
