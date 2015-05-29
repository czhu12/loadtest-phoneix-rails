defmodule PhoenixMessages.MessageController do
  use PhoenixMessages.Web, :controller

  alias PhoenixMessages.Message

  plug :action

  def index(conn, _params) do
    messages = Repo.all(Message)
    render(conn, "index.json", messages: messages)
  end

  def create(conn, message_params) do
    changeset = Message.changeset(%Message{}, message_params)

    if changeset.valid? do
      message = Repo.insert(changeset)
      render(conn, "show.json", message: message)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(PhoenixMessages.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    message = Repo.get(Message, id)
    render conn, "show.json", message: message
  end
end
