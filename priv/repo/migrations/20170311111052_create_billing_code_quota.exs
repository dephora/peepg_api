defmodule PeepgApi.Repo.Migrations.CreateBillingCodeQuota do
  use Ecto.Migration

  def change do
    create table(:billing_code_quotas) do
      add :billing_code_id, references(:billing_codes, on_delete: :nothing)

      timestamps()
    end
    create index(:billing_code_quotas, [:billing_code_id])

  end
end
