defmodule PeepgApi.BillingCodeQuota do
  use PeepgApi.Web, :model

  schema "billing_code_quotas" do
    belongs_to :billing_code, PeepgApi.BillingCode

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
