defmodule Slang.Repo.Migrations.CreateLogins do
  use Ecto.Migration

  def change do
    create table(:logins) do
      add :email, :string
      add :password, :string
      add :remember_me, :boolean, default: false, null: false

      timestamps()
    end

  end
end
