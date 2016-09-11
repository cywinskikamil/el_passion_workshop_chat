defmodule ElPasssionWorkshopChat.Room do
  use ElPasssionWorkshopChat.Web, :model

  schema "rooms" do
    field :name, :string

    has_many :messages, ElPasssionWorkshopChat.Message
    belongs_to :user, ElPasssionWorkshopChat.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :user_id])
    |> unique_constraint(:name)
    |> validate_required([:name, :user_id])
    |> validate_length(:name, min: 8)
  end
end
