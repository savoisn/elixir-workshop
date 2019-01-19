defmodule Slang.Accounts.Login do
  use Ecto.Schema
  import Ecto.Changeset


  schema "logins" do
    field :email, :string
    field :password, :string
    field :remember_me, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(login, attrs) do
    login
    |> cast(attrs, [:email, :password, :remember_me])
    |> validate_required([:email, :password, :remember_me])
  end
end
