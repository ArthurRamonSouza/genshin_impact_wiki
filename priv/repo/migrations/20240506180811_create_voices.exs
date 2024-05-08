defmodule GenshinImpactWiki.Repo.Migrations.CreateVoices do
  use Ecto.Migration

  def change do
    create table(:voices) do
      add :title, :string
      add :details, :string
      add :spoken_by, references(:characters, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:voices, [:spoken_by])
  end
end
