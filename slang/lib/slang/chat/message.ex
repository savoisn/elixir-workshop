defmodule Slang.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset


  schema "messages" do
    field :text, :string
    field :sender_id, :id
    field :room_id, :id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
