defmodule PeepgApi.Repo.Migrations.CreateBillingCode do
  use Ecto.Migration

  def change do
    create table(:billing_codes) do
      add :name, :string, null: false
      add :organization_id, references(:organizations, on_delete: :nothing)

      timestamps()
    end
    create index(:billing_codes, [:organization_id])

  end
end
