defmodule ElPasssionWorkshopChat.IntegrationCase do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  using do
    quote do
      use Hound.Helpers
      import ElPasssionWorkshopChat.IntegrationCase

      hound_session
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(ElPasssionWorkshopChat.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(ElPasssionWorkshopChat.Repo, {:shared, self()})
    end

    :ok
   end
end
