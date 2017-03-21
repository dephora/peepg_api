defmodule PeepgApi.Schema.AnalysisPreset do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "Represents the preset based on disease type and other settings ******???????**"
  object :analysis_preset do
    field :id, :id

    @desc "The name of the preset."
    field :name, :string
    
    @desc "The settings ............ analysis type*****"
    field :settings, :string

    @desc "Identifies the date and time when the object was inserted."  
    field :inserted_at, :string #need a datetime

    @desc "Identifies the date and time when the object was updated."  
    field :updated_at, :string #need a datetime

    field :billing_code, :billing_code, resolve: assoc(:billing_code)
  end

end