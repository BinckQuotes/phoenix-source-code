defmodule BinckquotesWeb.OldQuotesLive do
  use BinckquotesWeb, :live_view
  alias Binckquotes.Quotes

  def mount(_params, _session, socket) do
    {:ok, assign(socket, quotes: Quotes.list_quotes() |> Enum.filter(&(&1.is_old)))}
  end

  def render(assigns) do
    render(BinckquotesWeb.PageView, "quotes.html", assigns)
  end
end
