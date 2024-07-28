defmodule ExzeitableWeb.Repo do
  use Ecto.Repo,
    otp_app: :exzeitable_web,
    adapter: Ecto.Adapters.Postgres
end
