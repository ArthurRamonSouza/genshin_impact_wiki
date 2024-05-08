defmodule GenshinImpactWiki.GenshinFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GenshinImpactWiki.Genshin` context.
  """

  @doc """
  Generate a character.
  """
  def character_fixture(attrs \\ %{}) do
    {:ok, character} =
      attrs
      |> Enum.into(%{
        name: "some name",
        rarity: "some rarity",
        vision: "some vision",
        weapon: "some weapon",
        wiki_url: "some wiki_url"
      })
      |> GenshinImpactWiki.Genshin.create_character()

    character
  end

  @doc """
  Generate a banner.
  """
  def banner_fixture(attrs \\ %{}) do
    {:ok, banner} =
      attrs
      |> Enum.into(%{
        end: ~D[2024-05-05],
        name: "some name",
        start: ~D[2024-05-05],
        type: "some type",
        version: "some version"
      })
      |> GenshinImpactWiki.Genshin.create_banner()

    banner
  end

  @doc """
  Generate a feature.
  """
  def feature_fixture(attrs \\ %{}) do
    {:ok, feature} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> GenshinImpactWiki.Genshin.create_feature()

    feature
  end

  @doc """
  Generate a voice.
  """
  def voice_fixture(attrs \\ %{}) do
    {:ok, voice} =
      attrs
      |> Enum.into(%{
        details: "some details",
        title: "some title"
      })
      |> GenshinImpactWiki.Genshin.create_voice()

    voice
  end
end
