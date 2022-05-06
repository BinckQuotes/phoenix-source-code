defmodule BinckquotesWeb.QuoteControllerTest do
  use BinckquotesWeb.ConnCase

  import Binckquotes.QuotesFixtures

  alias Binckquotes.Quotes.Quote

  @create_attrs %{
    is_new: true,
    is_old: true,
    text: "some text"
  }
  @update_attrs %{
    is_new: false,
    is_old: false,
    text: "some updated text"
  }
  @invalid_attrs %{is_new: nil, is_old: nil, text: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all quotes", %{conn: conn} do
      conn = get(conn, Routes.quote_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create quote" do
    test "renders quote when data is valid", %{conn: conn} do
      conn = post(conn, Routes.quote_path(conn, :create), quote: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.quote_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "is_new" => true,
               "is_old" => true,
               "text" => "some text"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.quote_path(conn, :create), quote: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update quote" do
    setup [:create_quote]

    test "renders quote when data is valid", %{conn: conn, quote: %Quote{id: id} = quote} do
      conn = put(conn, Routes.quote_path(conn, :update, quote), quote: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.quote_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "is_new" => false,
               "is_old" => false,
               "text" => "some updated text"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, quote: quote} do
      conn = put(conn, Routes.quote_path(conn, :update, quote), quote: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete quote" do
    setup [:create_quote]

    test "deletes chosen quote", %{conn: conn, quote: quote} do
      conn = delete(conn, Routes.quote_path(conn, :delete, quote))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.quote_path(conn, :show, quote))
      end
    end
  end

  defp create_quote(_) do
    quote = quote_fixture()
    %{quote: quote}
  end
end
