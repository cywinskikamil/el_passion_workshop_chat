defmodule ElPasssionWorkshopChat.Room do
  use ElPasssionWorkshopChat.Web, :model

  schema "rooms" do
    field :name, :string

    has_many :messages, ElPasssionWorkshopChat.Message

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> unique_constraint(:name)
    |> validate_required([:name])
    |> validate_length(:name, min: 8)
  end
end
