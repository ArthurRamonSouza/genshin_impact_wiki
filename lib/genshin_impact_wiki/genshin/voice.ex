defmodule GenshinImpactWiki.Genshin.Voice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "voices" do
    field :title, :string
    field :details, :string
    field :spoken_by, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(voice, attrs) do
    voice
    |> cast(attrs, [:title, :details])
    |> validate_required([:title, :details])
    |> unique_constraint(:title)
  end
end
