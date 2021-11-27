defmodule DukaWeb.BusinessLive.Dashboard do

  use DukaWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :temperature, 1)}
  end

  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => _id}) do
    socket
    |> assign(:page_title, "Edit Product")
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Product")

  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Products")

  end


end
