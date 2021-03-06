defmodule PhoenixMessages.Message do
  use PhoenixMessages.Web, :model

  schema "messages" do
    field :body, :string
    field :user, :string

    timestamps
  end

  @required_fields ~w(body user)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
