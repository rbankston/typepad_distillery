defmodule Typepad.Router do
  use Typepad.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Typepad do
    pipe_through :browser # Use the default browser stack
    get "/pad/new", PadController, :new
    get "/pad/:id", PadController, :show
    get "/", PageController, :index
  end



  # Other scopes may use custom stacks.
  # scope "/api", Typepad do
  #   pipe_through :api
  # end
end
