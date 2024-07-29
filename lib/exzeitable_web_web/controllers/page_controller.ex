defmodule ExzeitableWebWeb.PageController do
  use ExzeitableWebWeb, :controller
  import Ecto.Query
  alias ExzeitableWeb.Accounts.User

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end

  def users(conn, _params) do
    query = from(u in User)
    render(conn, :users, layout: false, query: query)
  end
end
