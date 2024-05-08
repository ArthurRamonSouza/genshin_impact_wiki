defmodule GenshinImpactWiki.GenshinTest do
  use GenshinImpactWiki.DataCase

  alias GenshinImpactWiki.Genshin

  describe "characters" do
    alias GenshinImpactWiki.Genshin.Character

    import GenshinImpactWiki.GenshinFixtures

    @invalid_attrs %{name: nil, rarity: nil, weapon: nil, vision: nil, wiki_url: nil}

    test "list_characters/0 returns all characters" do
      character = character_fixture()
      assert Genshin.list_characters() == [character]
    end

    test "get_character!/1 returns the character with given id" do
      character = character_fixture()
      assert Genshin.get_character!(character.id) == character
    end

    test "create_character/1 with valid data creates a character" do
      valid_attrs = %{name: "some name", rarity: "some rarity", weapon: "some weapon", vision: "some vision", wiki_url: "some wiki_url"}

      assert {:ok, %Character{} = character} = Genshin.create_character(valid_attrs)
      assert character.name == "some name"
      assert character.rarity == "some rarity"
      assert character.weapon == "some weapon"
      assert character.vision == "some vision"
      assert character.wiki_url == "some wiki_url"
    end

    test "create_character/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Genshin.create_character(@invalid_attrs)
    end

    test "update_character/2 with valid data updates the character" do
      character = character_fixture()
      update_attrs = %{name: "some updated name", rarity: "some updated rarity", weapon: "some updated weapon", vision: "some updated vision", wiki_url: "some updated wiki_url"}

      assert {:ok, %Character{} = character} = Genshin.update_character(character, update_attrs)
      assert character.name == "some updated name"
      assert character.rarity == "some updated rarity"
      assert character.weapon == "some updated weapon"
      assert character.vision == "some updated vision"
      assert character.wiki_url == "some updated wiki_url"
    end

    test "update_character/2 with invalid data returns error changeset" do
      character = character_fixture()
      assert {:error, %Ecto.Changeset{}} = Genshin.update_character(character, @invalid_attrs)
      assert character == Genshin.get_character!(character.id)
    end

    test "delete_character/1 deletes the character" do
      character = character_fixture()
      assert {:ok, %Character{}} = Genshin.delete_character(character)
      assert_raise Ecto.NoResultsError, fn -> Genshin.get_character!(character.id) end
    end

    test "change_character/1 returns a character changeset" do
      character = character_fixture()
      assert %Ecto.Changeset{} = Genshin.change_character(character)
    end
  end

  describe "banners" do
    alias GenshinImpactWiki.Genshin.Banner

    import GenshinImpactWiki.GenshinFixtures

    @invalid_attrs %{name: nil, start: nil, type: nil, version: nil, end: nil}

    test "list_banners/0 returns all banners" do
      banner = banner_fixture()
      assert Genshin.list_banners() == [banner]
    end

    test "get_banner!/1 returns the banner with given id" do
      banner = banner_fixture()
      assert Genshin.get_banner!(banner.id) == banner
    end

    test "create_banner/1 with valid data creates a banner" do
      valid_attrs = %{name: "some name", start: ~D[2024-05-05], type: "some type", version: "some version", end: ~D[2024-05-05]}

      assert {:ok, %Banner{} = banner} = Genshin.create_banner(valid_attrs)
      assert banner.name == "some name"
      assert banner.start == ~D[2024-05-05]
      assert banner.type == "some type"
      assert banner.version == "some version"
      assert banner.end == ~D[2024-05-05]
    end

    test "create_banner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Genshin.create_banner(@invalid_attrs)
    end

    test "update_banner/2 with valid data updates the banner" do
      banner = banner_fixture()
      update_attrs = %{name: "some updated name", start: ~D[2024-05-06], type: "some updated type", version: "some updated version", end: ~D[2024-05-06]}

      assert {:ok, %Banner{} = banner} = Genshin.update_banner(banner, update_attrs)
      assert banner.name == "some updated name"
      assert banner.start == ~D[2024-05-06]
      assert banner.type == "some updated type"
      assert banner.version == "some updated version"
      assert banner.end == ~D[2024-05-06]
    end

    test "update_banner/2 with invalid data returns error changeset" do
      banner = banner_fixture()
      assert {:error, %Ecto.Changeset{}} = Genshin.update_banner(banner, @invalid_attrs)
      assert banner == Genshin.get_banner!(banner.id)
    end

    test "delete_banner/1 deletes the banner" do
      banner = banner_fixture()
      assert {:ok, %Banner{}} = Genshin.delete_banner(banner)
      assert_raise Ecto.NoResultsError, fn -> Genshin.get_banner!(banner.id) end
    end

    test "change_banner/1 returns a banner changeset" do
      banner = banner_fixture()
      assert %Ecto.Changeset{} = Genshin.change_banner(banner)
    end
  end

  describe "features" do
    alias GenshinImpactWiki.Genshin.Feature

    import GenshinImpactWiki.GenshinFixtures

    @invalid_attrs %{name: nil}

    test "list_features/0 returns all features" do
      feature = feature_fixture()
      assert Genshin.list_features() == [feature]
    end

    test "get_feature!/1 returns the feature with given id" do
      feature = feature_fixture()
      assert Genshin.get_feature!(feature.id) == feature
    end

    test "create_feature/1 with valid data creates a feature" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Feature{} = feature} = Genshin.create_feature(valid_attrs)
      assert feature.name == "some name"
    end

    test "create_feature/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Genshin.create_feature(@invalid_attrs)
    end

    test "update_feature/2 with valid data updates the feature" do
      feature = feature_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Feature{} = feature} = Genshin.update_feature(feature, update_attrs)
      assert feature.name == "some updated name"
    end

    test "update_feature/2 with invalid data returns error changeset" do
      feature = feature_fixture()
      assert {:error, %Ecto.Changeset{}} = Genshin.update_feature(feature, @invalid_attrs)
      assert feature == Genshin.get_feature!(feature.id)
    end

    test "delete_feature/1 deletes the feature" do
      feature = feature_fixture()
      assert {:ok, %Feature{}} = Genshin.delete_feature(feature)
      assert_raise Ecto.NoResultsError, fn -> Genshin.get_feature!(feature.id) end
    end

    test "change_feature/1 returns a feature changeset" do
      feature = feature_fixture()
      assert %Ecto.Changeset{} = Genshin.change_feature(feature)
    end
  end

  describe "voices" do
    alias GenshinImpactWiki.Genshin.Voice

    import GenshinImpactWiki.GenshinFixtures

    @invalid_attrs %{title: nil, details: nil}

    test "list_voices/0 returns all voices" do
      voice = voice_fixture()
      assert Genshin.list_voices() == [voice]
    end

    test "get_voice!/1 returns the voice with given id" do
      voice = voice_fixture()
      assert Genshin.get_voice!(voice.id) == voice
    end

    test "create_voice/1 with valid data creates a voice" do
      valid_attrs = %{title: "some title", details: "some details"}

      assert {:ok, %Voice{} = voice} = Genshin.create_voice(valid_attrs)
      assert voice.title == "some title"
      assert voice.details == "some details"
    end

    test "create_voice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Genshin.create_voice(@invalid_attrs)
    end

    test "update_voice/2 with valid data updates the voice" do
      voice = voice_fixture()
      update_attrs = %{title: "some updated title", details: "some updated details"}

      assert {:ok, %Voice{} = voice} = Genshin.update_voice(voice, update_attrs)
      assert voice.title == "some updated title"
      assert voice.details == "some updated details"
    end

    test "update_voice/2 with invalid data returns error changeset" do
      voice = voice_fixture()
      assert {:error, %Ecto.Changeset{}} = Genshin.update_voice(voice, @invalid_attrs)
      assert voice == Genshin.get_voice!(voice.id)
    end

    test "delete_voice/1 deletes the voice" do
      voice = voice_fixture()
      assert {:ok, %Voice{}} = Genshin.delete_voice(voice)
      assert_raise Ecto.NoResultsError, fn -> Genshin.get_voice!(voice.id) end
    end

    test "change_voice/1 returns a voice changeset" do
      voice = voice_fixture()
      assert %Ecto.Changeset{} = Genshin.change_voice(voice)
    end
  end
end
