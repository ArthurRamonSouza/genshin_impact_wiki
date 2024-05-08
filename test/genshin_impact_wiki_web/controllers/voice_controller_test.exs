defmodule GenshinImpactWikiWeb.VoiceControllerTest do
  use GenshinImpactWikiWeb.ConnCase

  import GenshinImpactWiki.GenshinFixtures

  @create_attrs %{title: "some title", details: "some details"}
  @update_attrs %{title: "some updated title", details: "some updated details"}
  @invalid_attrs %{title: nil, details: nil}

  describe "index" do
    test "lists all voices", %{conn: conn} do
      conn = get(conn, ~p"/voices")
      assert html_response(conn, 200) =~ "Listing Voices"
    end
  end

  describe "new voice" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/voices/new")
      assert html_response(conn, 200) =~ "New Voice"
    end
  end

  describe "create voice" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/voices", voice: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/voices/#{id}"

      conn = get(conn, ~p"/voices/#{id}")
      assert html_response(conn, 200) =~ "Voice #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/voices", voice: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Voice"
    end
  end

  describe "edit voice" do
    setup [:create_voice]

    test "renders form for editing chosen voice", %{conn: conn, voice: voice} do
      conn = get(conn, ~p"/voices/#{voice}/edit")
      assert html_response(conn, 200) =~ "Edit Voice"
    end
  end

  describe "update voice" do
    setup [:create_voice]

    test "redirects when data is valid", %{conn: conn, voice: voice} do
      conn = put(conn, ~p"/voices/#{voice}", voice: @update_attrs)
      assert redirected_to(conn) == ~p"/voices/#{voice}"

      conn = get(conn, ~p"/voices/#{voice}")
      assert html_response(conn, 200) =~ "some updated title"
    end

    test "renders errors when data is invalid", %{conn: conn, voice: voice} do
      conn = put(conn, ~p"/voices/#{voice}", voice: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Voice"
    end
  end

  describe "delete voice" do
    setup [:create_voice]

    test "deletes chosen voice", %{conn: conn, voice: voice} do
      conn = delete(conn, ~p"/voices/#{voice}")
      assert redirected_to(conn) == ~p"/voices"

      assert_error_sent 404, fn ->
        get(conn, ~p"/voices/#{voice}")
      end
    end
  end

  defp create_voice(_) do
    voice = voice_fixture()
    %{voice: voice}
  end
end
