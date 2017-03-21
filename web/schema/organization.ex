defmodule PeepgApi.Schema.Organization do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  # It's not really an 'account', should we use 'entity'?
  @desc "An organization is an account on CytoSavvy that has departments, teams, and users."
  object :organization do
    field :id, :id

    @desc "The organization's primary name."
    field :name_main, :string

    @desc "The organization's secondary name."
    field :name_secondary, :string

    @desc "The organization's primary phone number."
    field :phone_main, :string

    @desc "The organization's primary phone number extension."
    field :phone_main_ext, :string

    @desc "The organization's secondary phone number."
    field :phone_secondary, :string

    @desc "The organization's secondary phone number extension."
    field :phone_secondary_ext, :string

    @desc "The organization's primary email."
    field :email_main, :string

    @desc "The organization's secondary email."
    field :email_secondary, :string

    @desc "Something about locking accounts and the options"
    field :status, :string

    @desc "Comments about the organization."
    field :comments, :string

    @desc "Identifies the date and time when the object was inserted."
    field :inserted_at, :string #need a datetime

    @desc "Identifies the date and time when the object was updated."
    field :updated_at, :string #need a datetime


    field :departments, list_of(:department), resolve: assoc(:departments)
    # field :quota_periods, list_of(:quota_period), resolve: assoc(:quota_periods)
    # field :subscriptions, list_of(:subscription), resolve: assoc(:subscriptions)
    field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)

    # need to handle the contact lead / secondary
  end



end