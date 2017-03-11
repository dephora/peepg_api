defmodule PeepgApi.Image do
  use PeepgApi.Web, :model

  schema "images" do
    field :name_original, :string
    field :name_processed, :string
    field :filename_original, :string
    field :processing_stage, :string
    field :state, :string
    field :metadata, :string
    field :analysis_type, :string
    belongs_to :user, PeepgApi.User
    belongs_to :billing_code, PeepgApi.BillingCode

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name_original, :name_processed, :filename_original, :processing_stage, :state, :metadata, :analysis_type])
    |> validate_required([:name_original, :name_processed, :filename_original, :processing_stage, :state, :metadata, :analysis_type])
  end
end
