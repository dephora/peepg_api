defmodule PeepgApi.Schema.Subscription do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "************* NEED GOOD DESC ***************"
  object :subscription do
    field :id, :id
    
    @desc "Identifies the start date of the subscription."
    field :start_date, :string #need date
    
    @desc "Identifies the end date of the subscription."
    field :end_date, :string #need date
    
    @desc "Identifies the date and time when the object was inserted."
    field :inserted_at, :string #need a datetime
    
    @desc "Identifies the date and time when the object was updated."
    field :updated_at, :string #need a datetime

    @desc "The organization the subscription belongs to."
    field :organization, :organization, resolve: assoc(:organization)
    
    @desc "The plan the subscription belongs to."
    field :plan, :plan, resolve: assoc(:plan)
  end
end