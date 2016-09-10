defmodule ElPasssionWorkshopChat.Session do
  alias ElPasssionWorkshopChat.User
  alias ElPasssionWorkshopChat.Repo

  def login(session_params) do
    user = Repo.get_by!(User, %{email: String.downcase(session_params["email"])})
    case Comeonin.Bcrypt.checkpw(session_params["password"], user.crypted_password) do
      true -> {:ok, user}
      _ -> :error
    end
  end
end
