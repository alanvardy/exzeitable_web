defmodule ExzeitableWebWeb.Router do
  use ExzeitableWebWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ExzeitableWebWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ExzeitableWebWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/users", PageController, :users
  end
end
