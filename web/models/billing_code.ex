defmodule PeepgApi.BillingCode do
  use PeepgApi.Web, :model

  schema "billing_codes" do
    field :name, :string
    belongs_to :organization, PeepgApi.Organization

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
