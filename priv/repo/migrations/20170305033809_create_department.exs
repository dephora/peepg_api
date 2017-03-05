defmodule PeepgApi.Repo.Migrations.CreateDepartment do
  use Ecto.Migration

  def change do
    create table(:departments) do
      add :name, :string
      add :phone_main, :string
      add :phone_main_ext, :string
      add :phone_secondary, :string
      add :phone_secondary_ext, :string
      add :email, :string
      add :status, :string
      add :comments, :string

      timestamps()
    end

  end
end
