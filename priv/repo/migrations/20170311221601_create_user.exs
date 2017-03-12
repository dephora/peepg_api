defmodule PeepgApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :name_first, :string, null: false, default: ""
      add :name_last, :string, null: false, default: ""
      add :phone_main, :string
      add :phone_main_ext, :string
      add :status, :string, null: false
      add :roles_mask, :integer, null: false
      add :comments, :text
      add :password_hash, :string, null: false
      add :reset_password_token, :string
      add :reset_password_sent_at, :utc_datetime
      add :sign_in_count, :integer, null: false, default: 0
      add :current_sign_in_at, :utc_datetime
      add :last_sign_in_at, :utc_datetime
      add :current_sign_in_ip, :string
      add :last_sign_in_ip, :string
      add :remember_inserted_at, :utc_datetime
      add :department_id, references(:departments, on_delete: :nothing)

      timestamps()
    end
    create unique_index(:users, [:email])
    create unique_index(:users, [:reset_password_token])
    create index(:users, [:department_id])

  end
end
