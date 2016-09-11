defmodule ElPasssionWorkshopChat.SessionController do
  use ElPasssionWorkshopChat.Web, :controller

  def new(conn, _params) do
    render(conn)
  end

  def create(conn, %{"session" => session_params}) do
    case ElPasssionWorkshopChat.Session.login(session_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Succesfully logged in")
        |> redirect(to: room_path(conn, :index))
      :error ->
        conn
        |> put_flash(:info, "Wrong login or password")
        |> redirect(to: "/login")
    end
  end

  def delete(conn, _) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Succesfully logged out")
    |> redirect(to: room_path(conn, :index))
  end
end
