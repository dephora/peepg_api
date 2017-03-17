defmodule PeepgApi.Schema.Subscription do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "************* NEED GOOD DESC ***************"
  object :subscription do
    field :id, :id
    field :start_date, :string, #need a datetime
      description: "Identifies the start date of the subscription."
    field :end_date, :string, #need a datetime
      description: "Identifies the end date of the subscription."
    field :inserted_at, :string, #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :string, #need a datetime
      description: "Identifies the date and time when the object was updated."

    field :organization, :organization, resolve: assoc(:organization)
    field :plan, :plan, resolve: assoc(:plan)
    
  end
end