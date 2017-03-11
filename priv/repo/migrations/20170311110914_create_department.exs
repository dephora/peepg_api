defmodule PeepgApi.Repo.Migrations.CreateDepartment do
  use Ecto.Migration

  def change do
    create table(:departments) do
      add :name, :string, null: false
      add :phone_main, :string
      add :phone_main_ext, :string
      add :phone_secondary, :string
      add :phone_secondary_ext, :string
      add :email, :string, null: false
      add :status, :string, null: false
      add :comments, :string
      add :organization_id, references(:organizations, on_delete: :nothing), null: false
      add :billing_code_id, references(:billing_codes, on_delete: :nothing)

      timestamps()
    end
    create index(:departments, [:organization_id])
    create index(:departments, [:billing_code_id])

  end
end