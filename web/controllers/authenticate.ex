defmodule ElPasssionWorkshopChat.Plugs.Authenticate  do
  import Plug.Conn
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]
  import ElPasssionWorkshopChat.Session, only: [logged_in?: 1]
  import ElPasssionWorkshopChat.Router.Helpers

  def init(default), do: default

  def call(conn, default) do
    case logged_in?(conn) do
      true -> conn
      _ ->
        conn
        |> put_flash(:error, "You need to be signed in to seeee")
        |> redirect(to: session_path(conn, :new))
        |> halt
    end
  end
end
