defmodule ExzeitableWebWeb.UserController do
  use ExzeitableWebWeb, :controller

  import Ecto.Query

  alias ExzeitableWeb.Accounts.User
  alias ExzeitableWeb.Accounts
  alias ExzeitableWebWeb.Router.Helpers, as: Routes

  @type conn :: Plug.Conn.t()

  @spec index(conn, map) :: conn
  def index(conn, _params) do
    query = from(u in User)
    render(conn, "index.html", query: query, layout: false)
  end

  @spec new(conn, map) :: conn
  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  @spec create(conn, map) :: conn
  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  @spec show(conn, map) :: conn
  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.html", user: user)
  end

  @spec edit(conn, map) :: conn
  def edit(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    changeset = Accounts.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  @spec update(conn, map) :: conn
  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    case Accounts.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  @spec delete(conn, map) :: conn
  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    {:ok, _user} = Accounts.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: Routes.user_path(conn, :index))
  end

  # For testing formatter configuration
  @spec formatted_index(conn, map) :: conn
  def formatted_index(conn, _params), do: render(conn, "formatted_index.html")
end
