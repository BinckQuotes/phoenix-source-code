defmodule Binckquotes.Quotes.Quote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quotes" do
    field :is_new, :boolean, default: false
    field :is_old, :boolean, default: false
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(quote, attrs) do
    quote
    |> cast(attrs, [:text, :is_old, :is_new])
    |> validate_required([:text, :is_old, :is_new])
  end
end
