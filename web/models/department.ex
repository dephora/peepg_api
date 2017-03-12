defmodule PeepgApi.Department do
  use PeepgApi.Web, :model

  schema "departments" do
    field :name_main, :string
    field :name_secondary, :string
    field :phone_main, :string
    field :phone_main_ext, :string
    field :phone_secondary, :string
    field :phone_secondary_ext, :string
    field :email, :string
    field :status, :string
    field :comments, :string
    field :remember_inserted_at, Timex.Ecto.DateTime
    belongs_to :organization, PeepgApi.Organization
    belongs_to :billing_code, PeepgApi.BillingCode

    has_many :billing_codes, PeepgApi.BillingCode
    has_many :users, PeepgApi.User
    # has_many :images through billing_codes  --- is assoc better?
    # has_one :contact_lead, PeepgApi.User #through depts ?
    # has_one :contact_secondary, PeepgApi.User #through depts ?

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :phone_main, :phone_main_ext, :phone_secondary, :phone_secondary_ext, :email, :status, :comments, :remember_inserted_at])
    |> validate_required([:name, :phone_main, :email, :status])
    |> validate_format(:email,  ~r/@/)
    |> unique_constraint(:email)
  end
end
