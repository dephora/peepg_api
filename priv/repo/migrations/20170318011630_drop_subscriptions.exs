defmodule PeepgApi.Repo.Migrations.DropSubscriptions do
  use Ecto.Migration

  def change do
    drop table(:subscriptions)
  end
end
