defmodule Trackmgr.Repo do
  use Ecto.Repo,
    otp_app: :trackmgr,
    adapter: Ecto.Adapters.Postgres
end
