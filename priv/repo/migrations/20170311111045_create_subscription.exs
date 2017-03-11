defmodule PeepgApi.Repo.Migrations.CreateSubscription do
  use Ecto.Migration

  def change do
    create table(:subscriptions) do
      add :start_date, :date, null: false
      add :end_date, :date, null: false
      add :organization_id, references(:organizations, on_delete: :nothing)
      add :plan_id, references(:plans, on_delete: :nothing)

      timestamps()
    end
    create index(:subscriptions, [:organization_id])
    create index(:subscriptions, [:plan_id])

  end
end
