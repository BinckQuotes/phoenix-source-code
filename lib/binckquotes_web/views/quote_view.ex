defmodule BinckquotesWeb.QuoteView do
  use BinckquotesWeb, :view
  alias BinckquotesWeb.QuoteView

  def render("index.json", %{quotes: quotes}) do
    %{data: render_many(quotes, QuoteView, "quote.json")}
  end

  def render("show.json", %{quote: quote}) do
    %{data: render_one(quote, QuoteView, "quote.json")}
  end

  def render("quote.json", %{quote: quote}) do
    %{
      id: quote.id,
      text: quote.text,
      is_old: quote.is_old,
      is_new: quote.is_new
    }
  end
end
