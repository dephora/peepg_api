defmodule PeepgApi.Schema.AnalysisInfo do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "Represents the information of analyzed image."
  object :analysis_info do
    field :id, :id
    field :total_parts, :integer,
      description: "The total number of parts contained by the image."
    field :analyzed_parts, :integer,
      description: "The analyzed parts contained by the image."
    field :metadata, :string,
      description: "The metadata the image contains ***********"
    field :approval_status, :string,
      description: "The approval status of the analysis (approved, not approved,awaiting approval.)"
    field :approval_updated_at, :string, #datetime
      description: "Identifies the date / time of the approval status update."
    field :final_grade, :integer,
      description: "The final grade given to the image / analysis."
    field :inserted_at, :string, #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :string, #need a datetime
      description: "Identifies the date and time when the object was updated."

    field :image, :image, resolve: assoc(:image)
    # approval_updated_by_id (user)
  end

end