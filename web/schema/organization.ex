defmodule PeepgApi.Schema.Organization do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  # It's not really an 'account', should we use 'entity'?
  @desc "An organization is an account on CytoSavvy that has departments, teams, and users."
  object :organization do
    field :id, :id
    field :name_main, :string,
      description: "The organization's primary name."
    field :name_secondary, :string,
      description: "The organization's secondary name."
    field :phone_main, :string,
      description: "The organization's primary phone number."
    field :phone_main_ext, :string,
      description: "The organization's primary phone number extension."
    field :phone_secondary, :string,
      description: "The organization's secondary phone number."
    field :phone_secondary_ext, :string,
      description: "The organization's secondary phone number extension."
    field :email_main, :string,
      description: "The organization's primary email."
    field :email_secondary, :string,
      description: "The organization's secondary email."
    field :status, :string,
      description: "Something about locking accounts and the options"
    field :comments, :string,
      description: "Comments about the organization."
    field :inserted_at, :string, #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :string, #need a datetime
      description: "Identifies the date and time when the object was updated."

    field :departments, list_of(:department), resolve: assoc(:departments)
    # field :quota_periods, list_of(:quota_period), resolve: assoc(:quota_periods)
    # field :subscriptions, list_of(:subscription), resolve: assoc(:subscriptions)
    field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)

    # need to handle the contact lead / secondary
  end

 

end