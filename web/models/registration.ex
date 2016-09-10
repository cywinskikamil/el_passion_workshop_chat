defmodule ElPasssionWorkshopChat.Registration do
  import Ecto.Changeset, only: [put_change: 3]
  alias ElPasssionWorkshopChat.Repo

  def create(changeset) do
    changeset
    |> put_change(:crypted_password, Comeonin.Bcrypt.hashpwsalt(changeset.params["password"]))
    |> Repo.insert
  end
end
