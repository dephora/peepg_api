defmodule PeepgApi.Schema.User do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "A user is an individual's CytoSavvy account that has access to image management and other services."
  object :user do
    field :id, :id
    
    @desc "The email is the username of the user."
    field :email, :string
    
    @desc "The user's first name."    
    field :name_first, :string
    
    @desc "The user's last name."
    field :name_last, :string
    
    @desc "The user's main phone number."
    field :phone_main, :string
    
    @desc "The user's main phone number extension."
    field :phone_main_ext, :string
    
    @desc "Something about locking accounts and the options."
    field :status, :string

    @desc "Comments about the user."
    field :comments, :string
    
    @desc "The user's role."
    field :roles_mask, :integer
    
    @desc "The number of times the user has signed in."
    field :sign_in_count, :integer
    
    @desc "Identifies the date and time of the current user sign-in."
    field :current_sign_in_at, :string #datetime
    
    @desc "Identifies the date and time of the last user sign-in."
    field :last_sign_in_at, :string #datetime
    
    @desc "Identifies the IP of the current user sign-in."
    field :current_sign_in_ip, :string
    
    @desc "Identifies the IP of the last user sign-in."
    field :last_sign_in_ip, :string
    
    @desc "Identifies the date and time when the object was inserted."
    field :inserted_at, :string #need a datetime
    
    @desc "Identifies the date and time when the object was updated."
    field :updated_at, :string #need a datetime

    # can a user be in multiple depts?
    @desc "The department the user belongs to."
    field :department, :department, resolve: assoc(:department)
    
    @desc "A list of images that belong to the user."
    field :images, list_of(:image), resolve: assoc(:images)
  end

 

end