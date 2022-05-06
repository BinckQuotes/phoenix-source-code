defmodule BinckquotesWeb.NewQuotesLive do
  use BinckquotesWeb, :live_view
  alias Binckquotes.Quotes

  def mount(_params, _session, socket) do
    {:ok, assign(socket, quotes: Quotes.list_quotes() |> Enum.filter(&(&1.is_new)))}
  end

  def render(assigns) do
    render(BinckquotesWeb.PageView, "quotes.html", assigns)
  end
end
