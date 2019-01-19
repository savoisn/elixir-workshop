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


  pipeline :jwt_authenticated do
		plug Slang.Guardian.AuthPipeline
	end

  pipeline :with_session do
		plug Slang.Guardian.AuthBrowserPipeline
  end


  scope "/", SlangWeb do
    #pipe_through [:browser, :jwt_authenticated]
    pipe_through [:browser, :with_session]

    get "/", PageController, :index
		get "/logins/login", LoginController, :login
		get "/logins/logout", LoginController, :logout
		post "/logins/validate", LoginController, :login_validate
		resources "/logins", LoginController
  end

  # Other scopes may use custom stacks.
   scope "/api/v1", SlangWeb do
     pipe_through :api
     #resources "users", UserController, only: [:create, :show]
     post "/sign_up", UserController, :create
     post "/sign_in", UserController, :sign_in
   end

  scope "/api/v1", SlangWeb do
		pipe_through [:api, :jwt_authenticated]

		get "/my_user", UserController, :show
	end

end
