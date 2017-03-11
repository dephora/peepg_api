defmodule PeepgApi.Repo.Migrations.CreateAnalysisInfo do
  use Ecto.Migration

  def change do
    create table(:analysis_infos) do
      add :total_parts, :integer
      add :analyzed_parts, :integer
      add :metadata, :string
      add :approval_status, :string
      add :approval_updated_at, :utc_datetime
      add :final_grade, :integer
      add :image_id, references(:images, on_delete: :nothing)

      timestamps()
    end
    create index(:analysis_infos, [:image_id])

  end
end
