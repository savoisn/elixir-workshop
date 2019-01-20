# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Slang.Repo.insert!(%Slang.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias Slang.Chat
alias Slang.Chat.Room
alias Slang.Accounts
alias Slang.Accounts.User
alias Slang.Repo

# USERS
case Repo.get_by(User, email: "nicolas.savois@gmail.com") do
  nil ->
    {:ok, _changeset } = Accounts.create_user %{
      email: "nicolas.savois@gmail.com",
      password: "niconico",
      password_confirmation: "niconico"
    }
  %User{} = user -> 
    IO.inspect("User #{user.email} Lobby already exists, nothing to do")
end

# Default Rooms
case Repo.get_by(Room, name: "lobby") do
  nil ->
    {:ok, _changeset} = Chat.create_room %{
      name: "lobby",
      description: "default room"
    }
  %Room{} = room -> 
    IO.inspect("Room #{room.name} already exists, nothing to do")
end

