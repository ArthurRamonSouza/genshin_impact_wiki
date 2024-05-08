defmodule GenshinImpactWiki.Genshin do
  @moduledoc """
  The Genshin context.
  """

  import Ecto.Query, warn: false
  alias GenshinImpactWiki.Repo

  alias GenshinImpactWiki.Genshin.Character

  @doc """
  Returns the list of characters.

  ## Examples

      iex> list_characters()
      [%Character{}, ...]

  """
  def list_characters do
    Repo.all(Character)
  end

  @doc """
  Gets a single character.

  Raises `Ecto.NoResultsError` if the Character does not exist.

  ## Examples

      iex> get_character!(123)
      %Character{}

      iex> get_character!(456)
      ** (Ecto.NoResultsError)

  """
  def get_character!(id), do: Repo.get!(Character, id)

  @doc """
  Creates a character.

  ## Examples

      iex> create_character(%{field: value})
      {:ok, %Character{}}

      iex> create_character(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_character(attrs \\ %{}) do
    %Character{}
    |> Character.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a character.

  ## Examples

      iex> update_character(character, %{field: new_value})
      {:ok, %Character{}}

      iex> update_character(character, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_character(%Character{} = character, attrs) do
    character
    |> Character.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a character.

  ## Examples

      iex> delete_character(character)
      {:ok, %Character{}}

      iex> delete_character(character)
      {:error, %Ecto.Changeset{}}

  """
  def delete_character(%Character{} = character) do
    Repo.delete(character)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking character changes.

  ## Examples

      iex> change_character(character)
      %Ecto.Changeset{data: %Character{}}

  """
  def change_character(%Character{} = character, attrs \\ %{}) do
    Character.changeset(character, attrs)
  end

  alias GenshinImpactWiki.Genshin.Banner

  @doc """
  Returns the list of banners.

  ## Examples

      iex> list_banners()
      [%Banner{}, ...]

  """
  def list_banners do
    Repo.all(Banner)
  end

  @doc """
  Gets a single banner.

  Raises `Ecto.NoResultsError` if the Banner does not exist.

  ## Examples

      iex> get_banner!(123)
      %Banner{}

      iex> get_banner!(456)
      ** (Ecto.NoResultsError)

  """
  def get_banner!(id), do: Repo.get!(Banner, id)

  @doc """
  Creates a banner.

  ## Examples

      iex> create_banner(%{field: value})
      {:ok, %Banner{}}

      iex> create_banner(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_banner(attrs \\ %{}) do
    %Banner{}
    |> Banner.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a banner.

  ## Examples

      iex> update_banner(banner, %{field: new_value})
      {:ok, %Banner{}}

      iex> update_banner(banner, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_banner(%Banner{} = banner, attrs) do
    banner
    |> Banner.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a banner.

  ## Examples

      iex> delete_banner(banner)
      {:ok, %Banner{}}

      iex> delete_banner(banner)
      {:error, %Ecto.Changeset{}}

  """
  def delete_banner(%Banner{} = banner) do
    Repo.delete(banner)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking banner changes.

  ## Examples

      iex> change_banner(banner)
      %Ecto.Changeset{data: %Banner{}}

  """
  def change_banner(%Banner{} = banner, attrs \\ %{}) do
    Banner.changeset(banner, attrs)
  end

  alias GenshinImpactWiki.Genshin.Feature

  @doc """
  Returns the list of features.

  ## Examples

      iex> list_features()
      [%Feature{}, ...]

  """
  def list_features do
    Repo.all(Feature)
  end

  @doc """
  Gets a single feature.

  Raises `Ecto.NoResultsError` if the Feature does not exist.

  ## Examples

      iex> get_feature!(123)
      %Feature{}

      iex> get_feature!(456)
      ** (Ecto.NoResultsError)

  """
  def get_feature!(id), do: Repo.get!(Feature, id)

  @doc """
  Creates a feature.

  ## Examples

      iex> create_feature(%{field: value})
      {:ok, %Feature{}}

      iex> create_feature(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_feature(attrs \\ %{}) do
    %Feature{}
    |> Feature.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a feature.

  ## Examples

      iex> update_feature(feature, %{field: new_value})
      {:ok, %Feature{}}

      iex> update_feature(feature, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_feature(%Feature{} = feature, attrs) do
    feature
    |> Feature.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a feature.

  ## Examples

      iex> delete_feature(feature)
      {:ok, %Feature{}}

      iex> delete_feature(feature)
      {:error, %Ecto.Changeset{}}

  """
  def delete_feature(%Feature{} = feature) do
    Repo.delete(feature)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking feature changes.

  ## Examples

      iex> change_feature(feature)
      %Ecto.Changeset{data: %Feature{}}

  """
  def change_feature(%Feature{} = feature, attrs \\ %{}) do
    Feature.changeset(feature, attrs)
  end

  alias GenshinImpactWiki.Genshin.Voice

  @doc """
  Returns the list of voices.

  ## Examples

      iex> list_voices()
      [%Voice{}, ...]

  """
  def list_voices do
    Repo.all(Voice)
  end

  @doc """
  Gets a single voice.

  Raises `Ecto.NoResultsError` if the Voice does not exist.

  ## Examples

      iex> get_voice!(123)
      %Voice{}

      iex> get_voice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_voice!(id), do: Repo.get!(Voice, id)

  @doc """
  Creates a voice.

  ## Examples

      iex> create_voice(%{field: value})
      {:ok, %Voice{}}

      iex> create_voice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_voice(attrs \\ %{}) do
    %Voice{}
    |> Voice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a voice.

  ## Examples

      iex> update_voice(voice, %{field: new_value})
      {:ok, %Voice{}}

      iex> update_voice(voice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_voice(%Voice{} = voice, attrs) do
    voice
    |> Voice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a voice.

  ## Examples

      iex> delete_voice(voice)
      {:ok, %Voice{}}

      iex> delete_voice(voice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_voice(%Voice{} = voice) do
    Repo.delete(voice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking voice changes.

  ## Examples

      iex> change_voice(voice)
      %Ecto.Changeset{data: %Voice{}}

  """
  def change_voice(%Voice{} = voice, attrs \\ %{}) do
    Voice.changeset(voice, attrs)
  end
end
