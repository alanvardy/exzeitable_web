defmodule ExzeitableWebWeb.Tables.User do
  @moduledoc "Users table"
  import Ecto.Query
  alias ExzeitableWeb.Accounts.User
  alias ExzeitableWebWeb.Router.Helpers, as: Routes

  @light_gray "gray-200"
  @gray "gray-500"
  @dark_gray "gray-700"

  @button """
  px-2 mx-1 
  text-#{@gray} bg-white border border-#{@gray} 
  hover:bg-#{@light_gray} hover:text-#{@dark_gray}
  """

  @pagination """
  flex items-center justify-center
  px-3 h-8 ms-0 leading-tight 
  text-#{@gray} bg-white border border-#{@gray} 
  hover:bg-#{@light_gray} hover:text-#{@dark_gray}
  """

  use Exzeitable,
    # Required
    repo: ExzeitableWeb.Repo,
    routes: Routes,
    path: :user_path,
    action_buttons: [:show],
    query: from(u in User),
    fields: [
      name: [],
      location: [],
      hobby: []
    ],
    html_classes: [
      {"exz-pagination-ul", "inline-flex -space-x-px text-sm my-3"},
      {"exz-row", "inline-flex w-full justify-between"},
      {"exz-sort-link", "text-sm text-#{@gray} mx-1 font-normal"},
      {"exz-hide-link", "text-sm text-#{@gray} mx-1 font-normal"},
      {"exz-info-button", "text-sm"},
      {"exz-search-field-wrapper", "inline-flex"},
      {"exz-pagination-wrapper", ""},
      {"exz-search-field", "h-8 my-3"},
      {"exz-counter-field", @pagination <> "my-3"},
      {"exz-pagination-a exz-pagination-width", @pagination},
      {"exz-pagination-a", @pagination},
      {"exz-table", "table-auto divide-y divide-#{@gray} my-5"},
      {"exz-action-show", @button},
      {"exz-action-edit", @button}
    ]

  # The callback that renders your table
  def render(assigns), do: ~H"<%= build_table(assigns) %>"
end
