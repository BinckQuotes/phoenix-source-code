defmodule BinckquotesWeb.RandomQuoteLive do
  use BinckquotesWeb, :live_view
  alias Binckquotes.Quotes

  def mount(_params, _session, socket) do
    {:ok, assign(socket, quotes: [get_random_quote()])}
  end

  def render(assigns) do
    render(BinckquotesWeb.PageView, "quotes.html", assigns)
  end

  defp get_random_quote() do
    Quotes.list_quotes()
      |> length()
      |> :rand.uniform()
      |> Quotes.get_quote!()
  end
end
