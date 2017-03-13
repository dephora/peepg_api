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
  @desc "An organization which is th"
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
    field :status, :string,
      description: "Something about locking accounts and the options"
    field :comments, :string, 
      description: "Any additional notes"
    field :inserted_at, :datetime #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :datetime #need a datetime
      description: "Identifies the date and time when the object was updated."

    field :departments, list_of(:department), resolve: assoc(:departments)
    # # # field :quota_periods, list_of(:quota_period), resolve: assoc(:quota_periods)
    field :subscriptions, list_of(:subscription), resolve: assoc(:subscriptions)
    field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)
    
    # can we get users and images for all depts within the org?

    # field :users, list_of(:user), resolve: assoc(:users)
    # field :images, list_of(:image), resolve: assoc(:billing_codes)

    # need to handle the contact lead / secondary
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
    field :status, :string, 
      description: "Something about locking accounts and the options."
    field :comments, :string,
      description: "Any additional notes."

    field :organization, :organization, resolve: assoc(:organization)  
    field :billing_code, :billing_code, resolve: assoc(:billing_code)

    field :users, list_of(:user), resolve: assoc(:users)
    field :images, list_of(:image), resolve: assoc(:billing_codes)
    field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)

    # need to handle the contact lead / secondary
  end

  @desc "Represents an individual's CytoSavvy account. A user's email is their login. A user belongs to a department."
  object :user do
    field :id, :id
    field :email, :string, 
      description: "The email is the username of the user."
    field :name_first, :string,
      description: "The user's first name."
    field :name_last, :string,
      description: "The user's last name."
    field :phone_main, :string,
      description: "The user's phone number."
    field :phone_main_ext, :string
      description: "The user's phone number extension."
    field :status, :string,
      description: "Something about locking accounts and the options."
    field :comments, :string, 
      description: "Identifies comments about the user."
    field :roles_mask, :integer,
    description: "The user's role."
    field :sign_in_count, :integer,
      description: "The number of times the user has signed in."
    field :current_sign_in_at, :string, #datetime
      description: "Identifies the current date and time of the user sign-in."
    field :last_sign_in_at, :string, #datetime
      description: "Identifies the last date and time of the user sign-in."
    field :current_sign_in_ip, :string,
      description: "Identifies the current IP address of the user."
    field :last_sign_in_ip, :string,
      description: "Identifies the last IP address of the user."

    # can a user be in multiple depts?  
    field :department, :department, resolve: assoc(:department),
      description: "The department the user belongs to."
    field :images, list_of(:image), resolve: assoc(:images),
      description: "A list of images that belong to the user."
  end

  object :billing_code do
    field :id, :id
    field :name, :string

    field :organization, :organization, resolve: assoc(:organization)
  end

  @desc "Unsure if this is the proper way to handle this"
  object :billing_group do
    field :id, :id

    field :billing_code, :billing_code, resolve: assoc(:billing_code)
    field :department, :department, resolve: assoc(:department)
  end

  object :subscription do
    field :id, :id
    field :start_date, :string #datetime
    field :end_date, :string #datetime

    field :organization, :organization, resolve: assoc(:organization)
    field :plan, :plan, resolve: assoc(:plan)
  end

  object :plan do
    field :id, :id
    field :plan_code, :string
    field :name, :string
    field :description, :string
    field :active, :boolean
    field :plan_interval_unit, :string
    field :plan_interval_length, :integer
    field :plan_quota, :integer
  end

  object :image do
    field :id, :id
    field :name_original, :string
    field :name_processed, :string
    field :filename_original, :string
    field :processing_stage, :string
    field :state, :string
    field :metadata, :string
    field :analysis_type, :string,
      description: "FISH, Renal, Prostate, etc.."

    field :user, :user, resolve: assoc(:user)
    field :billing_code, :billing_code, resolve: assoc(:billing_code)
    
    # has_one analysis_info
  end

  object :analysis_info do
    field :total_parts, :integer
    field :analyzed_parts, :integer
    field :metadata, :string
    field :approval_status, :string
    field :approval_updated_at, :string #datetime
    field :final_grade, :integer

    field :image, :image, resolve: assoc(:image)
    # approval_updated_by_id (user)
  end

  object :analysis_preset do
    field :name, :string
    field :settings, :string

    field :billing_code, :billing_code, resolve: assoc(:billing_code)
  end

end