defmodule SlangWeb.RoomChannel do
  use SlangWeb, :channel
	
	alias Slang.Accounts

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end
  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end
  

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("new_msg", %{"msg" => msg, "user_id" => user_id}, socket) do
    user = Accounts.get_user!(user_id)

    broadcast!(socket, "new_msg", %{msg: msg, user_email: user.email})
    {:noreply, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (room:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
