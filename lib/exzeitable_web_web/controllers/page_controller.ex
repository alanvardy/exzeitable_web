defmodule ExzeitableWebWeb.PageController do
  use ExzeitableWebWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end
end
