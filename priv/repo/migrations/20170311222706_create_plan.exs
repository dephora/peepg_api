defmodule PeepgApi.Repo.Migrations.CreatePlan do
  use Ecto.Migration

  def change do
    create table(:plans) do
      add :plan_code, :string, null: false
      add :name, :string, null: false
      add :description, :string
      add :active, :boolean, default: false, null: false
      add :plan_interval_unit, :string, null: false
      add :plan_interval_length, :integer, null: false
      add :plan_quota, :integer, null: false

      timestamps()
    end
    create unique_index(:plans, [:description])

  end
end
