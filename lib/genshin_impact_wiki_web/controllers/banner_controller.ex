defmodule GenshinImpactWikiWeb.BannerController do
  use GenshinImpactWikiWeb, :controller

  alias GenshinImpactWiki.Genshin.Banner

  def index(conn, _params) do
    page_param = conn.params["page"] || "1"
    limit_param = conn.params["limit"] || "5"

    page = String.to_integer(page_param)
    limit = String.to_integer(limit_param)

    response_body = Gshimpact.banners(page, limit)

    banners_map = Jason.decode!(response_body, keys: :atoms)

    banners = banners_map.results
    IO.inspect(banners)

    banners_struct =
      Enum.map(banners, fn banner ->
        %Banner{
          id: banner[:id],
          name: banner[:name],
          start: banner[:start],
          type: banner[:type],
          version: banner[:version],
          end: banner[:end]
        }
      end)

    IO.inspect(banners_struct)

    render(conn, :index, layout: false, banners: banners_struct, page: page, limit: limit)
  end

  def show(conn, _params) do
    id_param = conn.params["id"] || "1"
    id = String.to_integer(id_param)

    response_body = Gshimpact.banners_id(id)
    banner_map = Jason.decode!(response_body, keys: :atoms)

    banner = banner_map.result

    featured = banner.featured
    IO.inspect(featured)

    banner_struct =
      %Banner{}
      |> Map.put(:id, banner.id)
      |> Map.put(:name, banner.name)
      |> Map.put(:start, banner.start)
      |> Map.put(:type, banner.type)
      |> Map.put(:version, banner.version)
      |> Map.put(:end, banner.end)
      |> Map.put(:featured, banner.featured)

    render(conn, :show,
      layout: false,
      banner: banner_struct,
      featured: featured
    )
  end

  def current(conn, _params) do
    response_body = Gshimpact.banners_current()

    banners_map = Jason.decode!(response_body, keys: :atoms)

    banners = banners_map.results
    IO.inspect(banners)

    banners_struct =
      Enum.map(banners, fn banner ->
        %Banner{
          id: banner[:id],
          name: banner[:name],
          start: banner[:start],
          type: banner[:type],
          version: banner[:version],
          end: banner[:end]
        }
      end)

    IO.inspect(banners_struct)

    render(conn, :current, layout: false, banners: banners_struct)
  end
end
