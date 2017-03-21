defmodule PeepgApi.Schema.Department do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "A department is a CytoSavvy account that belongs to an organization and has users."
  object :department do

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

    field :organization, :organization, resolve: assoc(:organization)
    field :billing_code, :billing_code, resolve: assoc(:billing_code)

    field :users, list_of(:user), resolve: assoc(:users)
    field :images, list_of(:image), resolve: assoc(:billing_codes)
    field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)

    # need to handle the contact lead / secondary
  end

end