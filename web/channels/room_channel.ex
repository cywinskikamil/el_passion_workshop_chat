defmodule ElPasssionWorkshopChat.RoomChannel do
  use Phoenix.Channel
  alias ElPasssionWorkshopChat.Repo
  alias ElPasssionWorkshopChat.User
  alias ElPasssionWorkshopChat.Message

  def join("room:" <> _room_name, _params, socket) do
    {:ok, socket}
  end

  def handle_in("new_msg", %{"body" => body, "user_email" => user_email, "room_id" => room_id}, socket) do
    create_message(body, user_email, room_id)
    broadcast! socket, "new_msg", %{body: body}
    {:noreply, socket}
  end

  defp create_message(body, user_email, room_id) do
    user_id = Repo.get_by!(User, %{email: user_email}).id
    params = %{body: body, user_id: user_id, room_id: room_id}
    Message.changeset(%Message{}, params)
    |> Repo.insert!
  end
end
