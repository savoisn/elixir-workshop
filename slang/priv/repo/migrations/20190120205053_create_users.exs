defmodule Slang.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password, :string
      add :password_confirmation, :string

      timestamps()
    end

  end
end
