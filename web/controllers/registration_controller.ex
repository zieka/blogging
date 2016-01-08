defmodule Blogging.RegistrationController do
  use Blogging.Web, :controller
  alias Blogging.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    #render conn, changeset: changeset
    conn
    |> put_layout("auth.html") #this overides default layout
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
  	changeset = User.changeset(%User{}, user_params)

	  case Blogging.Registration.create(changeset, Blogging.Repo) do
	    {:ok, changeset} ->
	      #sign in the user
	      conn
        #|> put_session(:current_user, User.id)
      	|> put_flash(:info, "Your account was created")
      	|> redirect(to: "/posts")

	    {:error, changeset} ->
	      #show error message
	      conn
	      |> put_flash(:info, "Unable to create account")
        |> put_layout("auth.html") #this overides default layout
      	|> render("new.html", changeset: changeset)
	 	end
	end
end


