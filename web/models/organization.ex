defmodule PeepgApi.Organization do
  use PeepgApi.Web, :model

  schema "organizations" do
    field :name_main, :string
    field :name_secondary, :string
    field :phone_main, :string
    field :phone_main_ext, :string
    field :phone_secondary, :string
    field :phone_secondary_ext, :string
    field :email_main, :string
    field :email_secondary, :string
    field :status, :string
    field :comments, :string
    field :remember_inserted_at, Timex.Ecto.DateTime

    has_many :departments, PeepgApi.Department
    has_many :subscriptions, PeepgApi.Sub
    # has_many :quota_periods, PeepgApi.QuotaPeriod
    has_many :billing_codes, PeepgApi.BillingCode
    # has_one :contact_lead, PeepgApi.User #through depts ?
    # has_one :contact_secondary, PeepgApi.User #through depts ?

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name_main, :name_secondary, :phone_main, :phone_main_ext, :phone_secondary, :phone_secondary_ext, :email_main, :email_secondary, :status, :comments, :remember_inserted_at])
    |> validate_required([:name_main, :phone_main, :email_main, :status])
    |> validate_format(:email_main,  ~r/@/)
    |> validate_format(:email_secondary,  ~r/@/) #possible to test both at once?
  end
end
