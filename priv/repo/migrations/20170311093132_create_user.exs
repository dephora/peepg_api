defmodule PeepgApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :name_first, :string
      add :name_last, :string
      add :phone_main, :string
      add :phone_main_ext, :string
      add :status, :string
      add :roles_mask, :integer
      add :reset_password_token, :string
      add :reset_password_sent_at, :utc_datetime
      add :sign_in_count, :integer
      add :current_sign_in_at, :utc_datetime
      add :last_sign_in_at, :utc_datetime
      add :current_sign_in_ip, :string
      add :last_sign_in_ip, :string
      add :department_id, references(:departments, on_delete: :nothing)

      timestamps()
    end
    create unique_index(:users, [:email])
    create index(:users, [:department_id])

  end
end
