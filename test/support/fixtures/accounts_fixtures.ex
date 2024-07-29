defmodule ExzeitableWeb.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ExzeitableWeb.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        hobby: "some hobby",
        location: "some location",
        name: "some name"
      })
      |> ExzeitableWeb.Accounts.create_user()

    user
  end
end
