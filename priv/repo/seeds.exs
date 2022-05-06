# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Binckquotes.Repo.insert!(%Binckquotes.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Binckquotes.Repo
alias Binckquotes.Quotes.Quote

Repo.insert! %Quote{
  text: "ik zie er geil uit",
  is_new: true,
  is_old: true
}

Repo.insert! %Quote{
  text: "j'habite a cambreur college",
  is_new: false,
  is_old: true
}
