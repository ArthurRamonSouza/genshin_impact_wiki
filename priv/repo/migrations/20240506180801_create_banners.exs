defmodule GenshinImpactWiki.Repo.Migrations.CreateBanners do
  use Ecto.Migration

  def change do
    create table(:banners) do
      add :name, :string
      add :type, :string
      add :version, :string
      add :start, :date
      add :end, :date

      timestamps(type: :utc_datetime)
    end
  end
end
