defmodule PeepgApi.Plan do
  use PeepgApi.Web, :model

  schema "plans" do
    field :plan_code, :string
    field :name, :string
    field :description, :string
    field :active, :boolean, default: false
    field :plan_interval_unit, :string
    field :plan_interval_length, :integer
    field :plan_quota, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:plan_code, :name, :description, :active, :plan_interval_unit, :plan_interval_length, :plan_quota])
    |> validate_required([:plan_code, :name, :description, :active, :plan_interval_unit, :plan_interval_length, :plan_quota])
    |> unique_constraint(:description)
  end
end
