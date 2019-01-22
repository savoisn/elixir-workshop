defmodule SlangWeb.Router do

  use SlangWeb, :router

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

  pipeline :with_session do
		plug SlangWeb.Guardian.AuthBrowserPipeline
	end


  scope "/", SlangWeb do
    pipe_through [:browser, :with_session]

    get "/", PageController, :index
    resources "/users", UserController
    get "/login", UserController, :login
 		post "/logout", UserController, :logout

    post "/validate_login", UserController, :validate_login

    resources "/rooms", RoomController
    resources "/messages", MessageController
	end


  # Other scopes may use custom stacks.
  # scope "/api", SlangWeb do
  #   pipe_through :api
  # end
end
