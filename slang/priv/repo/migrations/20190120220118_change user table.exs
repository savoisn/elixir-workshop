defmodule Slang.Repo.Migrations.Change_user_table do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :password_hash, :text
      remove :password
      remove :password_confirmation
    end

  end
end
