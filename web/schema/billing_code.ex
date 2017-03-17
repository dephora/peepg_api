defmodule PeepgApi.Schema.BillingCode do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "************* NEED GOOD DESC ***************"
  object :billing_code do
    field :id, :id
    field :name, :string,
      description: "The billing code name."
    field :inserted_at, :string, #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :string, #need a datetime
      description: "Identifies the date and time when the object was updated."

    field :organization, :organization, resolve: assoc(:organization)
  end

end