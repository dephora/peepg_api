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
    has_one :analysis_info, PeepgApi.AnalysisInfo

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name_original, :name_processed, :filename_original, :processing_stage, :state, :metadata, :analysis_type])
    |> validate_required([:name_original, :filename_original, :analysis_type])
    |> validate_filename(:filename_original)
  end

  @doc """
  Validates a change contains a `.` in the name.
  """
  def validate_filename(changeset, field) do
    value = get_field(changeset, field)
    if value =~ "." do
      changeset
    else
      add_error(changeset, field, "Name does not contain a '.'")
    end
  end
end
