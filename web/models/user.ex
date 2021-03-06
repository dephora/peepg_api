defmodule PeepgApi.User do
  use PeepgApi.Web, :model

  schema "users" do
    field :email, :string
    field :name_first, :string
    field :name_last, :string
    field :phone_main, :string
    field :phone_main_ext, :string
    field :status, :string
    field :roles_mask, :integer
    field :comments, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :reset_password_token, :string
    field :reset_password_sent_at, Ecto.DateTime
    field :sign_in_count, :integer
    field :current_sign_in_at, Ecto.DateTime
    field :last_sign_in_at, Ecto.DateTime
    field :current_sign_in_ip, :string
    field :last_sign_in_ip, :string
    field :remember_inserted_at, Ecto.DateTime

    belongs_to :department, PeepgApi.Department
    has_many :images, PeepgApi.Image

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  ############ WE WILL NOT NEED THIS BUT HERE FOR TESTING #############
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name_first, :name_last, :phone_main, :phone_main_ext, :status, :roles_mask, :comments, :password_hash, :reset_password_token, :reset_password_sent_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :remember_inserted_at, :department_id])
    # TODO update validations
    |> validate_required([:email, :name_first, :name_last, :status, :roles_mask, :password_hash, :department_id])
    |> unique_constraint(:email)
    # |> unique_constraint(:reset_password_token)
  end

  def update_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name_first, :name_last, :phone_main, :phone_main_ext, :status, :roles_mask, :comments, :password, :reset_password_token, :reset_password_sent_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :remember_inserted_at, :department_id])
    # TODO update validations
    |> validate_required([:email, :name_first, :name_last, :status, :roles_mask, :password_hash, :department_id])
    |> unique_constraint(:email)
    |> put_pass_hash()
    # |> unique_constraint(:reset_password_token)
  end

  def registration_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name_first, :name_last, :phone_main, :phone_main_ext, :password])
    |> validate_required([:email, :name_first, :name_last, :password])
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end

end
