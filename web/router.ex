defmodule Blogging.Router do
  use Blogging.Web, :router

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

  scope "/", Blogging do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/posts", PostController
    resources "/registrations", RegistrationController, only: [:new, :create]

    get    "/login",  SessionController, :new
    post   "/login",  SessionController, :create
    delete "/logout", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", Blogging do
  #   pipe_through :api
  # end
end
