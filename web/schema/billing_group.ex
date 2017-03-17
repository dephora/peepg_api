defmodule PeepgApi.Schema.BillingGroup do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "************* NEED GOOD DESC ***************"
  object :billing_group do
    field :id, :id
    field :inserted_at, :string, #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :string, #need a datetime
      description: "Identifies the date and time when the object was updated."

    field :billing_code, :billing_code, resolve: assoc(:billing_code)
    field :department, :department, resolve: assoc(:department)
  end

end