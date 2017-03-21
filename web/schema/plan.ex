defmodule PeepgApi.Schema.Plan do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "************* NEED GOOD DESC ***************"
  object :plan do
    field :id, :id

    @desc "The code of the plan."
    field :plan_code, :string

    @desc "The name of the plan."
    field :name, :string

    @desc "The description of the plan."
    field :description, :string

    @desc "True if the plan is active."
    field :active, :boolean
    
    @desc "The plan interval unit of measurement (days, weeks, etc.)"
    field :plan_interval_unit, :string

    @desc "The plan interval length based on plan_interval_unit."
    field :plan_interval_length, :integer

    @desc "The limit of image uploads of the plan."
    field :plan_quota, :integer
    
    @desc "Identifies the date and time when the object was inserted."
    field :inserted_at, :string #need a datetime
    
    @desc "Identifies the date and time when the object was updated."
    field :updated_at, :string #need a datetime
  end
end