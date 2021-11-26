defmodule DukaWeb.BusinessLive.New do
  use DukaWeb, :live_view

  alias Duka.Businesses.Business

  def mount(_params, %{"current_user" => current_user}, socket) do
    {:ok,
    socket
    |> assign(:current_user, current_user)
    |> assign(:changeset, Business.changeset(%Business{}, %{}))

  }
  end

  def handle_event("save", %{"business" => business_params}, socket) do

    IO.inspect(business_params)

    {:noreply,
    socket
    |> assign(:user_id, 1)
    |> assign(:changeset, Business.changeset(%Business{}, %{}))
}
  end

end
