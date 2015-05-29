defmodule PhoenixMessages.PageController do
  use PhoenixMessages.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end