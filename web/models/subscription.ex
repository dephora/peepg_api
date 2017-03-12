defmodule PeepgApi.Subscription do
  use PeepgApi.Web, :model

  schema "subscriptions" do
    field :start_date, Timex.Ecto.Date
    field :end_date, Timex.Ecto.Date
    belongs_to :organization, PeepgApi.Organization
    belongs_to :plan, PeepgApi.Plan

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:start_date, :end_date])
    |> validate_required([:start_date, :end_date])
  end
end
