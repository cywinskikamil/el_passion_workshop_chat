defmodule ElPasssionWorkshopChat.PageController do
  use ElPasssionWorkshopChat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
