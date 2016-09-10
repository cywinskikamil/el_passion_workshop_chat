defmodule ElPasssionWorkshopChat.RegistrationTest do
  use ElPasssionWorkshopChat.IntegrationCase

  @tag :integration
  test "register new user" do
    navigate_to "/registrations/new"
    sign_up_form = find_element(:css, "form")

    sign_up_form
    |> find_within_element(:id, "user_email")
    |> fill_field("kamil@kamil.kamil")

    sign_up_form
    |> find_within_element(:id, "user_password")
    |> fill_field("password")

    submit_element(sign_up_form)

    assert page_source =~ "Your account was created"
  end
end
