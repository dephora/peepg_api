defmodule PeepgApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :name_first, :string, null: false
      add :name_last, :string, null: false
      add :phone_main, :string
      add :phone_main_ext, :string
      add :status, :string, null: false
      add :roles_mask, :integer, null: false
      add :password_hash, :string, null: false
      add :reset_password_token, :string, null: false
      add :reset_password_sent_at, :naive_datetime
      add :sign_in_count, :integer, default: 0
      add :current_sign_in_at, :naive_datetime
      add :last_sign_in_at, :naive_datetime
      add :current_sign_in_ip, :string
      add :last_sign_in_ip, :string
      add :department_id, references(:departments, on_delete: :nothing), null: false

      timestamps()
    end
    create unique_index(:users, [:email])
    create unique_index(:users, [:reset_password_token])
    create index(:users, [:department_id])

  end
end
