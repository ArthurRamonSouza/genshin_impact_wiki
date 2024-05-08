defmodule GenshinImpactWikiWeb.PageController do
  use GenshinImpactWikiWeb, :controller

  def home(conn, _params) do
    response_body = Gshimpact.root()
    data = Jason.decode!(response_body)

    message = Map.get(data, "message")

    endpoints_map = Map.get(data, "endpoints")
    banners_endpoint = Map.get(endpoints_map, "banners")
    characters_endpoint = Map.get(endpoints_map, "characters")
    voices_endpoint = Map.get(endpoints_map, "voices")

    statistics_map = Map.get(data, "statistics")
    banners = Map.get(statistics_map, "banners")
    characters = Map.get(statistics_map, "characters")
    voices = Map.get(statistics_map, "voices")

    IO.puts("Message: #{message}")
    IO.puts("banners_endpoint: #{banners_endpoint}")
    IO.puts("banners: #{banners}")
    IO.puts("characters_endpoint: #{characters_endpoint}")
    IO.puts("characters: #{characters}")
    IO.puts("voices_endpoint: #{voices_endpoint}")
    IO.puts("voices: #{voices}")

    render(
      conn,
      :home,
      layout: false,
      message: message,
      banners_endpoint: banners_endpoint,
      characters_endpoint: characters_endpoint,
      voices_endpoint: voices_endpoint,
      banners: banners,
      characters: characters,
      voices: voices
    )
  end
end
