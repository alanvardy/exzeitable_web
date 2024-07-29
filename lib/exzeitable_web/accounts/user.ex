defmodule ExzeitableWeb.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :location, :string
    field :hobby, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :location, :hobby])
    |> validate_required([:name, :location, :hobby])
  end
end
