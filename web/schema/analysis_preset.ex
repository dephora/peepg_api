defmodule PeepgApi.Schema.AnalysisPreset do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "Represents the preset based on disease type and other settings ******???????**"
  object :analysis_preset do
    field :id, :id
    field :name, :string,
      description: "The name of the preset."
    field :settings, :string,
      description: "The settings ............ analysis type*****"
    field :inserted_at, :string, #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :string, #need a datetime
      description: "Identifies the date and time when the object was updated."

    field :billing_code, :billing_code, resolve: assoc(:billing_code)
  end

end