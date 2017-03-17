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
    # # # field :quota_periods, list_of(:quota_period), resolve: assoc(:quota_periods)
    # field :subscriptions, list_of(:subscription), resolve: assoc(:subscriptions)
    field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)

    # can we get users and images for all depts within the org?

    # field :users, list_of(:user), resolve: assoc(:users)
    # field :images, list_of(:image), resolve: assoc(:billing_codes)

    # need to handle the contact lead / secondary
  end

 

  # It's not really an 'account', should we use 'entity'?
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

  # @desc "A subscription is an organization's start and end date of a particular plan - ????????????"
  object :subscription do
    field :id, :id
    field :start_date, :string, #datetime
      description: "Identifies the start date of the subscription."
    field :end_date, :string, #datetime
      description: "Identifies the end date of the subscription."
    field :inserted_at, :string, #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :string, #need a datetime
      description: "Identifies the date and time when the object was updated."

    field :organization, :organization, resolve: assoc(:organization)
    field :plan, :plan, resolve: assoc(:plan)
  end

  @desc "************* NEED GOOD DESC ***************"
  object :plan do
    field :id, :id
    field :plan_code, :string,
      description: "The code of the plan."
    field :name, :string,
      description: "The name of the plan."
    field :description, :string,
      description: "The description of the plan."
    field :active, :boolean,
      description: "True if the plan is active."
    field :plan_interval_unit, :string,
      description: "The plan interval unit of measurement (days, weeks, etc.)"
    field :plan_interval_length, :integer,
      description: "The plan interval length based on plan_interval_unit."
    field :plan_quota, :integer,
      description: "The limit of image uploads of the plan."
    field :inserted_at, :string, #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :string, #need a datetime
      description: "Identifies the date and time when the object was updated."
  end

  @desc "Represents an uploaded image."
  object :image do
    field :id, :id
    field :name_original, :string,
      description: "The ############################."
    field :name_processed, :string,
      description: "The ############################."
    field :filename_original, :string,
      description: "The original filename of the image."
    field :processing_stage, :string,
      description: "The processing stage of the image ***********"
    field :state, :string,
      description: "###################"
    field :metadata, :string,
      description: "The metadata the image contains."
    field :analysis_type, :string,     
    # https://hexdocs.pm/absinthe/Absinthe.Schema.Notation.html#enum/3
      description: "The analysis type of the image (FISH, Prostate, etc.)"
    field :inserted_at, :string, #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :string, #need a datetime
      description: "Identifies the date and time when the object was updated."

    field :user, :user, resolve: assoc(:user)
    field :billing_code, :billing_code, resolve: assoc(:billing_code)

    # has_one analysis_info
  end

  @desc "Represents the information of analyzed image."
  object :analysis_info do
    field :id, :id
    field :total_parts, :integer,
      description: "The total number of parts contained by the image."
    field :analyzed_parts, :integer,
      description: "The analyzed parts contained by the image."
    field :metadata, :string,
      description: "The metadata the image contains ***********"
    field :approval_status, :string,
      description: "The approval status of the analysis (approved, not approved,awaiting approval.)"
    field :approval_updated_at, :string, #datetime
      description: "Identifies the date / time of the approval status update."
    field :final_grade, :integer,
      description: "The final grade given to the image / analysis."
    field :inserted_at, :string, #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :string, #need a datetime
      description: "Identifies the date and time when the object was updated."

    field :image, :image, resolve: assoc(:image)
    # approval_updated_by_id (user)
  end


  @desc "Represents the preset based on disease type and other settings ******???????**"
  object :analysis_preset do
    field :id, :id
    field :name, :string,
      description: "The name of the preset."
    field :settings, :string,
      description: "The settings ............ analysis type*****"
    field :inserted_at, :string, #need a datetime
      description: "Identifies the date and time when the object was inserted."
    field :updated_at, :string, #need a datetime
      description: "Identifies the date and time when the object was updated."

    field :billing_code, :billing_code, resolve: assoc(:billing_code)
  end

end