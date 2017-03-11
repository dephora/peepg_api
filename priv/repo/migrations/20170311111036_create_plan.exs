defmodule PeepgApi.Repo.Migrations.CreatePlan do
  use Ecto.Migration

  def change do
    create table(:plans) do
      add :plan_code, :string, null: false
      add :name, :string
      add :description, :string
      add :active, :boolean, default: false, null: false
      add :plan_interval_unit, :string
      add :plan_interval_length, :integer
      add :plan_quota, :integer

      timestamps()
    end
    create unique_index(:plans, [:description])

  end
end
