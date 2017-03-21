defmodule PeepgApi.Schema.BillingCode do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "************* NEED GOOD DESC ***************"
  object :billing_code do
    field :id, :id

    @desc "The billing code name."
    field :name, :string

    @desc "Identifies the date and time when the object was inserted."
    field :inserted_at, :string #need a datetime
    
    @desc "Identifies the date and time when the object was updated." 
    field :updated_at, :string #need a datetime

    field :organization, :organization, resolve: assoc(:organization)
  end

end