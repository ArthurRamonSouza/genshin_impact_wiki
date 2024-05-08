defmodule GenshinImpactWikiWeb.FeatureControllerTest do
  use GenshinImpactWikiWeb.ConnCase

  import GenshinImpactWiki.GenshinFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all features", %{conn: conn} do
      conn = get(conn, ~p"/features")
      assert html_response(conn, 200) =~ "Listing Features"
    end
  end

  describe "new feature" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/features/new")
      assert html_response(conn, 200) =~ "New Feature"
    end
  end

  describe "create feature" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/features", feature: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/features/#{id}"

      conn = get(conn, ~p"/features/#{id}")
      assert html_response(conn, 200) =~ "Feature #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/features", feature: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Feature"
    end
  end

  describe "edit feature" do
    setup [:create_feature]

    test "renders form for editing chosen feature", %{conn: conn, feature: feature} do
      conn = get(conn, ~p"/features/#{feature}/edit")
      assert html_response(conn, 200) =~ "Edit Feature"
    end
  end

  describe "update feature" do
    setup [:create_feature]

    test "redirects when data is valid", %{conn: conn, feature: feature} do
      conn = put(conn, ~p"/features/#{feature}", feature: @update_attrs)
      assert redirected_to(conn) == ~p"/features/#{feature}"

      conn = get(conn, ~p"/features/#{feature}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, feature: feature} do
      conn = put(conn, ~p"/features/#{feature}", feature: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Feature"
    end
  end

  describe "delete feature" do
    setup [:create_feature]

    test "deletes chosen feature", %{conn: conn, feature: feature} do
      conn = delete(conn, ~p"/features/#{feature}")
      assert redirected_to(conn) == ~p"/features"

      assert_error_sent 404, fn ->
        get(conn, ~p"/features/#{feature}")
      end
    end
  end

  defp create_feature(_) do
    feature = feature_fixture()
    %{feature: feature}
  end
end
