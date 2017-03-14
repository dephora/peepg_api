defmodule PeepgApi.BillingCodeGroup do
  use PeepgApi.Web, :model

  schema "billing_code_groups" do
    belongs_to :billing_code, PeepgApi.BillingCode
    belongs_to :department, PeepgApi.Department

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:billing_code_id, :department_id])
    |> validate_required([:billing_code_id, :department_id])
  end
end
