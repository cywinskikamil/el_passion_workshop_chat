defmodule ElPasssionWorkshopChat.User do
  use ElPasssionWorkshopChat.Web, :model

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: true

    has_many :messages, ElPasssionWorkshopChat.Message
    has_many :rooms, ElPasssionWorkshopChat.Room

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
  end
end
