defmodule ElPasssionWorkshopChat.LoginTest do
  use ElPasssionWorkshopChat.IntegrationCase
  alias ElPasssionWorkshopChat.User
  alias ElPasssionWorkshopChat.Repo

  @tag :integration
  test "login" do
    User.changeset(%User{}, %{email: "kamil@kamil.kamil", password: "password"})
    |> ElPasssionWorkshopChat.Registration.create

    navigate_to "/login"

    login_form = find_element(:css, "form")

    login_form
    |> find_within_element(:id, "session_email")
    |> fill_field("kamil@kamil.kamil")

    login_form
    |> find_within_element(:id, "session_password")
    |> fill_field("password")

    submit_element(login_form)
    assert page_source =~ "Succesfully logged in"
  end
end

