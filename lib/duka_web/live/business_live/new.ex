defmodule DukaWeb.BusinessLive.New do
  use DukaWeb, :live_view
  alias Duka.Businesses
  alias Duka.Businesses.Business
  alias Duka.Accounts

  def mount(_params, %{"user_id"=> user_id}, socket) do

    user = Accounts.get_user(user_id)

    {:ok,
    socket
    |> assign(:user_id, user_id)
    |> assign(:user, user)
    |> assign(:changeset, Business.changeset(%Business{}, %{}))
    }
  end

  def handle_event("save", %{"business" => business_params}, socket) do
    IO.inspect(socket.assigns.user)

    case Businesses.create_business(socket.assigns.user, business_params) do

      {:ok, business} ->
        {:noreply,
        socket
        |> assign(:business, business)
        |> assign(:changeset, Business.changeset(%Business{}, %{}))
        }
      {:error, changeset} ->
        {:noreply,
        socket
        |> assign(:user_id, 1)
        |> assign(:changeset, changeset)
        }
    end

  end

end
