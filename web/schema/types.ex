defmodule PeepgApi.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  # Break this into multiple files 

  # @desc """
  # The `Time` scalar type represents time values provided in the ISOz
  # datetime format (that is, the ISO 8601 format without the timezone offset, eg,
  # "2015-06-24T04:50:34Z").
  # """
  # scalar :time, description: "ISOz time" do
  #   parse &Timex.DateFormat.parse(&1.value, "{ISOz}")
  #   serialize &Timex.DateFormat.format!(&1, "{ISOz}")
  # end

  object :organization do
    field :id, :id
    field :name_main, :string
    field :name_secondary, :string
    field :phone_main, :string
    field :phone_main_ext, :string
    field :phone_secondary, :string
    field :phone_secondary_ext, :string
    field :email_main, :string
    field :email_secondary, :string
    field :status, :string
    field :comments, :string, description: "Any additional notes."
    # field :users, list_of(:user), resolve: assoc(:users)
    # field :images, list_of(:image), resolve: assoc(:billing_codes)
    # field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)
  end

  @desc "A department, which belongs to an organization."
  object :department do
    field :id, :id
    field :name_main, :string
    field :name_secondary, :string
    field :phone_main, :string
    field :phone_main_ext, :string
    field :phone_secondary, :string
    field :phone_secondary_ext, :string
    field :email, :string
    field :status, :string
    field :comments, :string, description: "Any additional notes."
    field :users, list_of(:user), resolve: assoc(:users)
    # field :images, list_of(:image), resolve: assoc(:billing_codes)
    field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)
  end

  @desc "A user of the system. Their login is their email address. They belong to a department."
  object :user do
    field :id, :id
    field :email, :string, description: "The user login, this is unique."
    field :name_first, :string
    field :name_last, :string
    field :phone_main, :string
    field :phone_main_ext, :string
    field :status, :string
    field :comments, :string, description: "Any additional notes."
    field :roles_mask, :integer
    field :sign_in_count, :integer
    field :current_sign_in_at, :string 
    field :last_sign_in_at, :string
    field :current_sign_in_ip, :string
    field :last_sign_in_ip, :string
    field :departments, list_of(:department), resolve: assoc(:departments)
  end

  object :billing_code do
    field :id, :id
    field :name, :string
  end

  object :subscription do
    field :id, :id
    field :start_date, :string
    field :end_date, :string
  end

  

  


end