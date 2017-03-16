defmodule PeepgApi.Repo.Migrations.AlterDepartment do
  use Ecto.Migration

  def change do
    alter table(:departments) do
      modify :phone_main_ext, :string, null: true
    end
  end
end
