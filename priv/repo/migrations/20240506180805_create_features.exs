defmodule GenshinImpactWiki.Repo.Migrations.CreateFeatures do
  use Ecto.Migration

  def change do
    create table(:features) do
      add :name, :string
      add :banner_id, references(:banners, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:features, [:banner_id])
  end
end
