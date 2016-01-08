defmodule Blogging.RegistrationController do
  use Blogging.Web, :controller
  alias Blogging.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end
end


