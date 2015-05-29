defmodule PhoenixMessages.MessageView do
  use PhoenixMessages.Web, :view

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, "message.json")}
  end

  def render("show.json", %{message: message}) do
    %{data: render_one(message, "message.json")}
  end

  def render("message.json", %{message: message}) do
    %{id: message.id}
  end
end
