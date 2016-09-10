defmodule ElPasssionWorkshopChat.RegistrationController do
  use ElPasssionWorkshopChat.Web, :controller
  alias ElPasssionWorkshopChat.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, %{changeset: changeset})
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case ElPasssionWorkshopChat.Registration.create(changeset) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "Your account was created")
        |> redirect(to: room_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
