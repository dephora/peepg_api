defmodule PeepgApi.Repo.Migrations.CreateOrganization do
  use Ecto.Migration

  def change do
    create table(:organizaations) do
      add :name_main, :string
      add :name_secondary, :string
      add :phone_main, :string
      add :phone_main_ext, :string
      add :phone_secondary, :string
      add :phone_secondary_ext, :string
      add :email, :string
      add :status, :string

      timestamps()
    end

  end
end
