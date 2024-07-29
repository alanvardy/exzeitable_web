defmodule ExzeitableWeb.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :location, :string
      add :hobby, :string

      timestamps(type: :utc_datetime)
    end
  end
end
