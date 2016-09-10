defmodule ElPasssionWorkshopChat.UserTest do
  use ElPasssionWorkshopChat.ModelCase

  alias ElPasssionWorkshopChat.User

  @valid_attrs %{password: "some content", email: "some@content.com"}
  @invalid_attrs %{password: "siedem", email: "asdf!asdf.com"}
  @empty_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    assert changeset.errors[:password] ==  {"should be at least %{count} character(s)", [count: 8]}
    assert changeset.errors[:email] ==  {"has invalid format", []}
  end

  test "changeset with empty attributes" do
    changeset = User.changeset(%User{}, @empty_attrs)
    assert changeset.errors[:email] == {"can't be blank", []}
    assert changeset.errors[:password] == {"can't be blank", []}
  end
end
