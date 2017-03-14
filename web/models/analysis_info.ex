defmodule PeepgApi.AnalysisInfo do
  use PeepgApi.Web, :model

  schema "analysis_infos" do
    field :total_parts, :integer
    field :analyzed_parts, :integer
    field :metadata, :string
    field :approval_status, :string
    field :approval_updated_at, Timex.Ecto.DateTime
    field :final_grade, :integer

    belongs_to :image, PeepgApi.Image

    #todo approval_updated_by_id (user)

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:total_parts, :analyzed_parts, :metadata, :approval_status, :approval_updated_at, :final_grade, :image_id])
    # |> validate_required([:total_parts, :analyzed_parts, :metadata, :approval_status, :approval_updated_at, :final_grade, :image_id])
  end

  
  # def validate_part_difference(changeset, field) do
    
  # end

  
end
