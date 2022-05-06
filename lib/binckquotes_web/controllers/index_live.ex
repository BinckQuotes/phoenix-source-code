defmodule BinckquotesWeb.IndexLive do
  use BinckquotesWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, _: "")}
  end

  def render(assigns) do
    render(BinckquotesWeb.PageView, "index.html", assigns)
  end
end
