defmodule Blogging.SessionController do
  use Blogging.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end
end