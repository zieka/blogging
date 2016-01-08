defmodule Blogging.PageController do
  use Blogging.Web, :controller

  def index(conn, _params) do
     conn
  	|> render "index.html"
  end

  def new(conn, _params) do
     conn
    |> put_layout("auth.html") #this overides default layout
  	|> render "new.html"
  end
end
