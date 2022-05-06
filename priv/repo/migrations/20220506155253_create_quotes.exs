defmodule Binckquotes.Repo.Migrations.CreateQuotes do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :text, :string
      add :is_old, :boolean, default: false, null: false
      add :is_new, :boolean, default: false, null: false

      timestamps()
    end
  end
end
