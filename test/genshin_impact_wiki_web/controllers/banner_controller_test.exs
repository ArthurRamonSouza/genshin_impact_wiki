defmodule GenshinImpactWikiWeb.BannerControllerTest do
  use GenshinImpactWikiWeb.ConnCase

  import GenshinImpactWiki.GenshinFixtures

  @create_attrs %{name: "some name", start: ~D[2024-05-05], type: "some type", version: "some version", end: ~D[2024-05-05]}
  @update_attrs %{name: "some updated name", start: ~D[2024-05-06], type: "some updated type", version: "some updated version", end: ~D[2024-05-06]}
  @invalid_attrs %{name: nil, start: nil, type: nil, version: nil, end: nil}

  describe "index" do
    test "lists all banners", %{conn: conn} do
      conn = get(conn, ~p"/banners")
      assert html_response(conn, 200) =~ "Listing Banners"
    end
  end

  describe "new banner" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/banners/new")
      assert html_response(conn, 200) =~ "New Banner"
    end
  end

  describe "create banner" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/banners", banner: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/banners/#{id}"

      conn = get(conn, ~p"/banners/#{id}")
      assert html_response(conn, 200) =~ "Banner #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/banners", banner: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Banner"
    end
  end

  describe "edit banner" do
    setup [:create_banner]

    test "renders form for editing chosen banner", %{conn: conn, banner: banner} do
      conn = get(conn, ~p"/banners/#{banner}/edit")
      assert html_response(conn, 200) =~ "Edit Banner"
    end
  end

  describe "update banner" do
    setup [:create_banner]

    test "redirects when data is valid", %{conn: conn, banner: banner} do
      conn = put(conn, ~p"/banners/#{banner}", banner: @update_attrs)
      assert redirected_to(conn) == ~p"/banners/#{banner}"

      conn = get(conn, ~p"/banners/#{banner}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, banner: banner} do
      conn = put(conn, ~p"/banners/#{banner}", banner: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Banner"
    end
  end

  describe "delete banner" do
    setup [:create_banner]

    test "deletes chosen banner", %{conn: conn, banner: banner} do
      conn = delete(conn, ~p"/banners/#{banner}")
      assert redirected_to(conn) == ~p"/banners"

      assert_error_sent 404, fn ->
        get(conn, ~p"/banners/#{banner}")
      end
    end
  end

  defp create_banner(_) do
    banner = banner_fixture()
    %{banner: banner}
  end
end
