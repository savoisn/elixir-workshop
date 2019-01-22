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
#
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
    IO.inspect("User #{user.email} already exists, nothing to do")
end

case Repo.get_by(User, email: "another.user@gmail.com") do
  nil ->
    {:ok, _changeset } = Accounts.create_user %{
      email: "another.user@gmail.com",
      password: "password",
      password_confirmation: "password"
    }
  %User{} = user -> 
    IO.inspect("User #{user.email} already exists, nothing to do")
end

# Default Rooms
rooms = [
  %{ name: "Lobby", desc: "default room"}, 
  %{ name: "Troll Den", desc: "Where troll shout and each others"}
]

Enum.map(rooms, fn %{name: room_name, desc: room_desc} ->
  case Repo.get_by(Room, name: room_name) do
    nil ->
      {:ok, _changeset} = Chat.create_room %{
        name: room_name,
        description: room_desc
      }
    %Room{} = room -> 
      IO.inspect("Room #{room.name} already exists, nothing to do")
  end
end
)
