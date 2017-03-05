defmodule PeepgApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name_first, :string
      add :name_last, :string
      add :phone_main, :string
      add :phone_main_ext, :string
      add :email, :string
      add :status, :string
      add :role, :string

      timestamps()
    end

  end
end
