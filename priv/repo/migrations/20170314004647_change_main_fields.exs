defmodule PeepgApi.Repo.Migrations.ChangeMainFields do
  use Ecto.Migration

  def change do
    alter table(:organizations) do
      modify :name_main, :name_primary
      modify :phone_main, :phone_primary
      modify :phone_main_ext, :phone_primary_ext
    end

    alter table(:departments) do
      modify :name_main, :name_primary
      modify :phone_main, :phone_primary
      modify :phone_main_ext, :phone_primary_ext
    end

    alter table(:users) do
      modify :phone_main, :phone
      modify :phone_main_ext, :phone
    end

  end
end
