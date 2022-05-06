defmodule BinckquotesWeb.IndexLive do
  use BinckquotesWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(socket) do
    render(BinckquotesWeb.PageView, "index.html", socket)
  end
end
