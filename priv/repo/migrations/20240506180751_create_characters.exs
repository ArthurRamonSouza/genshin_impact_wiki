defmodule GenshinImpactWiki.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string
      add :rarity, :string
      add :weapon, :string
      add :vision, :string
      add :wiki_url, :string

      timestamps(type: :utc_datetime)
    end
  end
end
