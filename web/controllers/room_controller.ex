defmodule ElPasssionWorkshopChat.RoomController do
  use ElPasssionWorkshopChat.Web, :controller
  alias ElPasssionWorkshopChat.Repo
  alias ElPasssionWorkshopChat.Room
  alias ElPasssionWorkshopChat.Message
  import ElPasssionWorkshopChat.Session, only: [current_user: 1]

  plug ElPasssionWorkshopChat.Plugs.Authenticate

  def index(conn, _params) do
    rooms = Repo.all(Room) |> Repo.preload(:user)
    render conn, "index.html", %{rooms: rooms}
  end

  def new(conn, _params) do
    changeset = Room.changeset(%Room{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"room" => room_params}) do
    room_params = Map.put(room_params, "user_id", current_user(conn).id)
    changeset = Room.changeset(%Room{}, room_params)

    case Repo.insert(changeset) do
      {:ok, _room} ->
        conn
        |> put_flash(:info, "Room created successfully.")
        |> redirect(to: room_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    room = Repo.get!(Room, id)
    query = from m in Message, where: m.room_id == ^id
    messages = Repo.all(query) |> Repo.preload(:user)
    IO.inspect(messages)
    render(conn, "show.html", room: room, messages: messages)
  end

  def delete(conn, %{"id" => id}) do
    room = Repo.get!(Room, id)

    Repo.delete!(room)

    conn
    |> put_flash(:info, "Room deleted successfully.")
    |> redirect(to: room_path(conn, :index))
  end
end
