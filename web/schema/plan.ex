defmodule PeepgApi.Schema.Plan do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "************* NEED GOOD DESC ***************"
  object :plan do
    field :id, :id
    field :plan_code, :string,
      description: "The code of the plan."
    field :name, :string,
      description: "The name of the plan."
    field :description, :string,
      description: "The description of the plan."
    field :active, :boolean,
      description: "True if the plan is active."
    field :plan_interval_unit, :string,
      description: "The plan interval unit of measurement (days, weeks, etc.)"
    field :plan_interval_length, :integer,
      description: "The plan interval length based on plan_interval_unit."
    field :plan_quota, :integer,
      description: "The limit of image uploads of the plan."
    field :inserted_at, :string, #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :string, #need a datetime
      description: "Identifies the date and time when the object was updated."
  end
end