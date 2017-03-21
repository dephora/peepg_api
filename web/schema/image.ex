defmodule PeepgApi.Schema.Image do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "Represents an uploaded image."
  object :image do
    field :id, :id

    @desc "The ############################."
    field :name_original, :string

    @desc "The ############################."      
    field :name_processed, :string

    @desc "The original filename of the image." 
    field :filename_original, :string

    @desc "The processing stage of the image ***********" 
    field :processing_stage, :string
    
    @desc "########################"  
    field :state, :string

    @desc "The metadata the image contains."  
    field :metadata, :string
    
    @desc "The analysis type of the image (FISH, Prostate, etc.)"  
    field :analysis_type, :string
    # https://hexdocs.pm/absinthe/Absinthe.Schema.Notation.html#enum/3

    @desc "Identifies the date and time when the object was inserted." 
    field :inserted_at, :string #need a datetime

    @desc "Identifies the date and time when the object was updated."
    field :updated_at, :string #need a datetime
    
    field :user, :user, resolve: assoc(:user)
    field :billing_code, :billing_code, resolve: assoc(:billing_code)

    # has_one analysis_info
  end
end