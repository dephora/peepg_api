defmodule PeepgApi.Schema.AnalysisInfo do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "Represents the information of analyzed image."
  object :analysis_info do
    field :id, :id

    @desc "The total number of parts contained by the image."
    field :total_parts, :integer

    @desc "The analyzed parts contained by the image."
    field :analyzed_parts, :integer

    @desc "The metadata the image contains ***********"
    field :metadata, :string

    @desc "The approval status of the analysis (approved, not approved, awaiting approval.)" #TODO should this be an enum or list?
    field :approval_status, :string

    @desc "Identifies the date / time of the approval status update."
    field :approval_updated_at, :string #datetime

    @desc "The final grade given to the image / analysis."
    field :final_grade, :integer

    @desc "Identifies the date and time when the object was inserted."
    field :inserted_at, :string #need a datetime
    
    @desc "Identifies the date and time when the object was updated."
    field :updated_at, :string #need a datetime

    field :image, :image, resolve: assoc(:image)
    # approval_updated_by_id (user)
  end

end