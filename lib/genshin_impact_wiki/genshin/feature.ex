defmodule GenshinImpactWiki.Genshin.Feature do
  use Ecto.Schema
  import Ecto.Changeset

  schema "features" do
    field :name, :string
    field :banner_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(feature, attrs) do
    feature
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
