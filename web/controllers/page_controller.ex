defmodule Blogging.PageController do
  use Blogging.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
