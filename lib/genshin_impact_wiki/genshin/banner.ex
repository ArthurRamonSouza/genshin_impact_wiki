defmodule GenshinImpactWiki.Genshin.Banner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "banners" do
    field :name, :string
    field :start, :date
    field :type, :string
    field :version, :string
    field :end, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(banner, attrs) do
    banner
    |> cast(attrs, [:name, :type, :version, :start, :end])
    |> validate_required([:name, :type, :version, :start, :end])
    |> unique_constraint(:name)
  end
end
