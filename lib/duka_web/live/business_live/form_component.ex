defmodule DukaWeb.BusinessLive.FormComponent do

  use DukaWeb, :live_component

  alias Duka.Businesses.Business

  def update(_assigns, socket) do
    {:ok, assign(socket, :test, 1)}
  end


  def handle_event("event_name", _session, socket) do
    {:noreply,
    socket
    |> assign(:user_id, 1)

    }
  end

end
