defmodule BinckquotesWeb.QuotesManagementLive do
  use BinckquotesWeb, :live_view
  alias Binckquotes.Quotes

  def mount(_params, _session, socket) do
    {:ok, assign(socket, quotes: Quotes.list_quotes())}
  end

  def render(assigns) do
    render(BinckquotesWeb.PageView, "manage_quotes.html", assigns)
  end

  def handle_event("add_quote", %{"text" => text, "is_old" => is_old, "is_new" => is_new}, socket) do
    with {:ok, new_quote} <- Quotes.create_quote %{text: text, is_new: is_new |> to_bool(), is_old: is_old |> to_bool()} do
      {:noreply, assign(socket, :quotes, [ new_quote | socket.assigns.quotes ])}
    end
  end

  def handle_event("delete_quote", %{"id" => id}, socket) do
    with {:ok, deleted_quote} <- Quotes.delete_quote(Enum.find(socket.assigns.quotes, &(&1.id == id |> String.to_integer()))) do
      {:noreply, assign(socket, socket.assigns.quotes |> Enum.filter(&(&1.id != deleted_quote)))}
    end
  end

  defp to_bool(s) do
    if s == "true" || s == :true || s == true || s == "t" || s == :t do
      true
    else
      false
    end
  end
end
