defmodule PeepgApi.Repo.Migrations.CreateBillingCodeGroup do
  use Ecto.Migration

  def change do
    create table(:billing_code_groups) do
      add :billing_code_id, references(:billing_codes, on_delete: :nothing)
      add :department_id, references(:departments, on_delete: :nothing)

      timestamps()
    end
    create index(:billing_code_groups, [:billing_code_id])
    create index(:billing_code_groups, [:department_id])

  end
end
