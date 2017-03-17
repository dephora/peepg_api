defmodule PeepgApi.Schema.Image do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "Represents an uploaded image."
  object :image do
    field :id, :id
    field :name_original, :string,
      description: "The ############################."
    field :name_processed, :string,
      description: "The ############################."
    field :filename_original, :string,
      description: "The original filename of the image."
    field :processing_stage, :string,
      description: "The processing stage of the image ***********"
    field :state, :string,
      description: "###################"
    field :metadata, :string,
      description: "The metadata the image contains."
    field :analysis_type, :string,     
    # https://hexdocs.pm/absinthe/Absinthe.Schema.Notation.html#enum/3
      description: "The analysis type of the image (FISH, Prostate, etc.)"
    field :inserted_at, :string, #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :string, #need a datetime
      description: "Identifies the date and time when the object was updated."

    field :user, :user, resolve: assoc(:user)
    field :billing_code, :billing_code, resolve: assoc(:billing_code)

    # has_one analysis_info
  end
end