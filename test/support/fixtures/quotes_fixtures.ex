defmodule Binckquotes.QuotesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Binckquotes.Quotes` context.
  """

  @doc """
  Generate a quote.
  """
  def quote_fixture(attrs \\ %{}) do
    {:ok, quote} =
      attrs
      |> Enum.into(%{
        is_new: true,
        is_old: true,
        text: "some text"
      })
      |> Binckquotes.Quotes.create_quote()

    quote
  end
end
