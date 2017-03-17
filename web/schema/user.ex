defmodule PeepgApi.Schema.User do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "A user is an individual's CytoSavvy account that has access to image management and other services."
  object :user do
    field :id, :id
    field :email, :string,
      description: "The email is the username of the user."
    field :name_first, :string,
      description: "The user's first name."
    field :name_last, :string,
      description: "The user's last name."
    field :phone_main, :string,
      description: "The user's main phone number."
    field :phone_main_ext, :string,
      description: "The user's main phone number extension."
    field :status, :string,
      description: "Something about locking accounts and the options."
    field :comments, :string,
      description: "Comments about the user."
    field :roles_mask, :integer,
    description: "The user's role."
    field :sign_in_count, :integer,
      description: "The number of times the user has signed in."
    field :current_sign_in_at, :string, #datetime
      description: "Identifies the date and time of the current user sign-in."
    field :last_sign_in_at, :string, #datetime
      description: "Identifies the date and time of the last user sign-in."
    field :current_sign_in_ip, :string,
      description: "Identifies the IP of the current user sign-in."
    field :last_sign_in_ip, :string,
      description: "Identifies the IP of the last user sign-in."
    field :inserted_at, :string, #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :string, #need a datetime
      description: "Identifies the date and time when the object was updated."

    # can a user be in multiple depts?
    field :department, :department, resolve: assoc(:department),
      description: "The department the user belongs to."
    field :images, list_of(:image), resolve: assoc(:images),
      description: "A list of images that belong to the user."
  end

 

end