defmodule PeepgApi.Repo.Migrations.CreateAnalysisPreset do
  use Ecto.Migration

  def change do
    create table(:analysis_presets) do
      add :name, :string, null: false, size: 50
      add :settings, :string
      add :billing_code_id, references(:billing_codes, on_delete: :nothing)

      timestamps()
    end
    create unique_index(:analysis_presets, [:name])
    create index(:analysis_presets, [:billing_code_id])

  end
end
