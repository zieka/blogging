defmodule Blogging.SessionController do
  use Blogging.Web, :controller

  def new(conn, _params) do
    conn
    |> put_layout("auth.html") #this overides default layout
  	|> render "new.html"
  end

  def create(conn, %{"session" => session_params}) do
	  case Blogging.Session.login(session_params, Blogging.Repo) do
	    {:ok, user} ->
	      conn
	      |> put_session(:current_user, user.id)
	      |> put_flash(:info, "Logged in")
	      |> redirect(to: "/")
	    :error ->
	      conn
	      |> put_flash(:info, "Wrong email or password")
	      |> render("new.html")
	  end
	end

	def delete(conn, _) do
	  conn
	  |> delete_session(:current_user)
	  |> put_flash(:info, "Logged out")
	  |> redirect(to: "/")
	end
end