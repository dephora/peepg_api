defmodule PeepgApi.Repo.Migrations.CreateOrganization do
  use Ecto.Migration

  def change do
    create table(:organizations) do
      add :name_main, :string
      add :name_secondary, :string
      add :phone_main, :string
      add :phone_main_ext, :string
      add :phone_secondary, :string
      add :phone_secondary_ext, :string
      add :email_main, :string
      add :email_secondary, :string
      add :status, :string
      add :comments, :string
      add :remember_inserted_at, :utc_datetime

      timestamps()
    end

  end
end
