# defmodule PeepgApi.Schema.User do
#   use Absinthe.Schema.Notation
#   use Absinthe.Ecto, repo: PeepgApi.Repo

#   # Break this into multiple files 

#   # @desc """
#   # The `Time` scalar type represents time values provided in the ISOz
#   # datetime format (that is, the ISO 8601 format without the timezone offset, eg,
#   # "2015-06-24T04:50:34Z").
#   # """
#   # scalar :time, description: "ISOz time" do
#   #   parse &Timex.DateFormat.parse(&1.value, "{ISOz}")
#   #   serialize &Timex.DateFormat.format!(&1, "{ISOz}")
#   # end

#   object :organization do
#     field :id, :id
#     field :name_main, :string
#     field :name_secondary, :string
#     field :phone_main, :string
#     field :phone_main_ext, :string
#     field :phone_secondary, :string
#     field :phone_secondary_ext, :string
#     field :email_main, :string
#     field :email_secondary, :string
#     field :status, :string,
#       description: "Something about locking accounts and the options."
#     field :comments, :string, description: "Any additional notes."
#     field :departments, list_of(:department), resolve: assoc(:departments)
#     # # # field :quota_periods, list_of(:quota_period), resolve: assoc(:quota_periods)
#     field :subscriptions, list_of(:subscription), resolve: assoc(:subscriptions)
#     field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)
    
#     # can we get users and images for all depts within the org?

#     # field :users, list_of(:user), resolve: assoc(:users)
#     # field :images, list_of(:image), resolve: assoc(:billing_codes)

#     # need to handle the contact lead / secondary
#   end

#   @desc "A department, which belongs to an organization."
#   object :department do
#     field :id, :id
#     field :name_main, :string
#     field :name_secondary, :string
#     field :phone_main, :string
#     field :phone_main_ext, :string
#     field :phone_secondary, :string
#     field :phone_secondary_ext, :string
#     field :email, :string
#     field :status, :string, 
#       description: "Something about locking accounts and the options."
#     field :comments, :string,
#       description: "Any additional notes."

#     field :organization, :organization, resolve: assoc(:organization)  
#     field :billing_code, :billing_code, resolve: assoc(:billing_code)

#     field :users, list_of(:user), resolve: assoc(:users)
#     field :images, list_of(:image), resolve: assoc(:billing_codes)
#     field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)

#     # need to handle the contact lead / secondary
#   end

#   @desc "A user of the system. Their login is their email address. They belong to a department."
#   object :user do
#     field :id, :id
#     field :email, :string, description: "The user login, this is unique."
#     field :name_first, :string
#     field :name_last, :string
#     field :phone_main, :string
#     field :phone_main_ext, :string
#     field :status, :string,
#       description: "Something about locking accounts and the options."
#     field :comments, :string, description: "Any additional notes."
#     field :roles_mask, :integer
#     field :sign_in_count, :integer
#     field :current_sign_in_at, :string #datetime
#     field :last_sign_in_at, :string #datetime
#     field :current_sign_in_ip, :string
#     field :last_sign_in_ip, :string

#     field :department, :department, resolve: assoc(:department)
#     field :images, list_of(:image), resolve: assoc(:images) 
#   end

#   object :billing_code do
#     field :id, :id
#     field :name, :string

#     field :organization, :organization, resolve: assoc(:organization)
#   end

#   @desc "Unsure if this is the proper way to handle this"
#   object :billing_group do
#     field :id, :id

#     field :billing_code, :billing_code, resolve: assoc(:billing_code)
#     field :department, :department, resolve: assoc(:department)
#   end

#   object :subscription do
#     field :id, :id
#     field :start_date, :string #datetime
#     field :end_date, :string #datetime

#     field :organization, :organization, resolve: assoc(:organization)
#     field :plan, :plan, resolve: assoc(:plan)
#   end

#   object :plan do
#     field :id, :id
#     field :plan_code, :string
#     field :name, :string
#     field :description, :string
#     field :active, :boolean
#     field :plan_interval_unit, :string
#     field :plan_interval_length, :integer
#     field :plan_quota, :integer
#   end

#   object :image do
#     field :id, :id
#     field :name_original, :string
#     field :name_processed, :string
#     field :filename_original, :string
#     field :processing_stage, :string
#     field :state, :string
#     field :metadata, :string
#     field :analysis_type, :string,
#       description: "FISH, Renal, Prostate, etc.."

#     field :user, :user, resolve: assoc(:user)
#     field :billing_code, :billing_code, resolve: assoc(:billing_code)
    
#     # has_one analysis_info
#   end

#   object :analysis_info do
#     field :total_parts, :integer
#     field :analyzed_parts, :integer
#     field :metadata, :string
#     field :approval_status, :string
#     field :approval_updated_at, :string #datetime
#     field :final_grade, :integer

#     field :image, :image, resolve: assoc(:image)
#     # approval_updated_by_id (user)
#   end

#   object :analysis_preset do
#     field :name, :string
#     field :settings, :string

#     field :billing_code, :billing_code, resolve: assoc(:billing_code)
#   end

# end