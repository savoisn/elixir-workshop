defmodule SlangWeb.RoomChannel do
  use Phoenix.Channel
  alias Slang.Accounts
  alias Slang.Chat

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end
  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end
  def handle_in("new_msg", %{"body" => body, "user_id" => user_id}, socket) do
    user = Accounts.get_user!(user_id)
    case Chat.create_message(%{text: body, sender_id: user_id, room_id: 1}) do
      {:ok, message} -> IO.puts "message created"
      {:error, changeset} -> IO.inspect changeset
    end
    broadcast!(socket, "new_msg", %{body: body, user_email: user.email})
    {:noreply, socket}
  end

  def handle_in("history", %{"room_id" => room_id}, socket) do
    messages = Chat.get_messages_for_room(room_id)
    formated_messages = Enum.map(messages, fn message -> 
      {text, id} = message
      %{body: text, user_email: Accounts.get_user!(id).email} end)
    broadcast!(socket, "history", %{history: formated_messages})
    {:noreply, socket}
  end

end
