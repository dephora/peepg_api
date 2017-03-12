defmodule PeepgApi.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :name_original, :string, null: false
      add :name_processed, :string
      add :filename_original, :string, null: false
      add :processing_stage, :string
      add :state, :string
      add :metadata, :string
      add :analysis_type, :string, null: false
      add :user_id, references(:users, on_delete: :nothing)
      add :billing_code_id, references(:billing_codes, on_delete: :nothing)

      timestamps()
    end
    create index(:images, [:user_id])
    create index(:images, [:billing_code_id])

  end
end
