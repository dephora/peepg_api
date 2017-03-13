defmodule PeepgApi.Repo.Migrations.AddFieldsToDepartments do
  use Ecto.Migration

  def change do
    alter table(:departments) do
      add :name_secondary, :string
    end
  end
end
