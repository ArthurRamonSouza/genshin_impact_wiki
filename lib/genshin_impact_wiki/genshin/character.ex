defmodule GenshinImpactWiki.Genshin.Character do
  use Ecto.Schema
  import Ecto.Changeset

  schema "characters" do
    field :name, :string
    field :rarity, :string
    field :weapon, :string
    field :vision, :string
    field :wiki_url, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(character, attrs) do
    character
    |> cast(attrs, [:name, :rarity, :weapon, :vision, :wiki_url])
    |> validate_required([:name, :rarity, :weapon, :vision, :wiki_url])
    |> unique_constraint(:name)
  end
end
