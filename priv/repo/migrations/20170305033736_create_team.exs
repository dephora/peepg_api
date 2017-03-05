defmodule PeepgApi.Repo.Migrations.CreateTeam do
  use Ecto.Migration

  def change do
    create table(:teams) do
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
