defmodule PhoenixMessages.MessageTest do
  use PhoenixMessages.ModelCase

  alias PhoenixMessages.Message

  @valid_attrs %{body: "some content", message: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Message.changeset(%Message{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Message.changeset(%Message{}, @invalid_attrs)
    refute changeset.valid?
  end
end
