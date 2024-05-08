defmodule GenshinImpactWikiWeb.VoiceController do
  use GenshinImpactWikiWeb, :controller

  alias GenshinImpactWiki.Genshin.Voice

  def index(conn, _params) do
    page_param = conn.params["page"] || "1"

    page = String.to_integer(page_param)

    response_body = Gshimpact.voices(page)

    voice_map = Jason.decode!(response_body, keys: :atoms)

    voices = voice_map.results

    voice_structs =
      Enum.map(voices, fn voice ->
        character = voice.spoken_by
        %Voice{
          title: voice[:title],
          details: voice[:details],
          spoken_by: character.name,
        }
      end)

    render(conn, :index, layout: false, page: page, voices: voice_structs)
  end
end
