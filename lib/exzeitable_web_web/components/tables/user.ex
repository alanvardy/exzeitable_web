defmodule ExzeitableWebWeb.Tables.User do
  @moduledoc "Users table"
  import Ecto.Query
  alias ExzeitableWeb.Accounts.User

  use Exzeitable,
    # Required
    repo: ExzeitableWeb.Repo,
    routes: ExzeitableWeb.Router,
    path: :file_path,
    action_buttons: [:show, :edit],
    query: from(u in User),

    # Optional
    debounce: 300

  # The callback that renders your table
  def render(assigns), do: ~H"<%= build_table(assigns) %>"
end
