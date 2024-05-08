defmodule GenshinImpactWikiWeb.CharacterController do
  use GenshinImpactWikiWeb, :controller

  alias GenshinImpactWiki.Genshin.Character

  def index(conn, _params) do
    page_param = conn.params["page"] || "1"
    limit_param = conn.params["limit"] || "5"

    page = String.to_integer(page_param)
    limit = String.to_integer(limit_param)

    response_body = Gshimpact.characters(page, limit)

    # Convertemos o JSON em um mapa Elixir
    character_map = Jason.decode!(response_body, keys: :atoms)

    # Recuperando lista de personagens
    characters = character_map.results

    character_structs =
      Enum.map(characters, fn character ->
        %Character{
          id: character[:id],
          name: character[:name],
          wiki_url: character[:wiki_url],
          vision: character[:vision],
          weapon: character[:weapon],
          rarity: character[:rarity]
        }
      end)

    render(conn, :index, layout: false, characters: character_structs, page: page, limit: limit)
  end

  def show(conn, _params) do
    id_param = conn.params["id"] || "1"
    id = String.to_integer(id_param)

    response_body = Gshimpact.characters_id(id)
    character_map = Jason.decode!(response_body, keys: :atoms)

    character = character_map.result
    voice_actors_list = character.voice_actors

    voice_actor_map = hd(voice_actors_list)
    IO.inspect(voice_actor_map)

    # Extrai as informações dos voice actors do mapa
    english = Map.get(voice_actor_map, :English)
    chinese = Map.get(voice_actor_map, :Chinese)
    japanese = Map.get(voice_actor_map, :Japanese)
    korean = Map.get(voice_actor_map, :Korean)

    render(conn, :show,
      layout: false,
      character: character,
      english: english,
      chinese: chinese,
      japanese: japanese,
      korean: korean
    )
  end

  def search(conn, _params) do
    name = conn.params["name"] || ""
    region = conn.params["region"] || ""
    vision = conn.params["vision"] || ""
    rarity = conn.params["raity"] || ""
    weapon = conn.params["weapon"] || ""
    model_type = conn.params["model_type"] || ""

    response_body = Gshimpact.characters_search(name, region, vision, rarity, weapon, model_type)

    # Convertemos o JSON em um mapa Elixir
    character_map = Jason.decode!(response_body, keys: :atoms)

    # Recuperando lista de personagens
    characters = character_map.results

    character_structs =
      Enum.map(characters, fn character ->
        %Character{
          id: character[:id],
          name: character[:name],
          wiki_url: character[:wiki_url],
          vision: character[:vision],
          weapon: character[:weapon],
          rarity: character[:rarity]
        }
      end)

    render(conn, :search, layout: false, characters: character_structs)
  end
end
