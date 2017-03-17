defmodule PeepgApi.Schema.Department do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "A department is a CytoSavvy account that belongs to an organization and has users."
  object :department do

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

    field :organization, :organization, resolve: assoc(:organization)
    field :billing_code, :billing_code, resolve: assoc(:billing_code)

    field :users, list_of(:user), resolve: assoc(:users)
    field :images, list_of(:image), resolve: assoc(:billing_codes)
    field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)

    # need to handle the contact lead / secondary
  end

end