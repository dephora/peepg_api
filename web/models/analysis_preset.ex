defmodule PeepgApi.AnalysisPreset do
  use PeepgApi.Web, :model

  schema "analysis_presets" do
    field :name, :string
    field :settings, :string

    belongs_to :billing_code, PeepgApi.BillingCode

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :settings, :billing_code_id])
    |> validate_required([:name, :settings, :billing_code_id])
    |> unique_constraint(:name)
    |> validate_length(:name, max: 50)
  end

  
end
