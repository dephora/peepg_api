# defmodule PeepgApi.Schema.Types do
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
#     # field non_null(:name_main), :string
#     field :name_secondary, :string
#     field non_null(:phone_main), :string
#     field :phone_main_ext, :string
#     field :phone_secondary, :string
#     field :phone_secondary_ext, :string
#     field non_null(:email_main), :string
#     field :email_secondary, :string
#     field non_null(:status), :string
#     field :comments, :string
#     # field :users, list_of(:user), resolve: assoc(:users)
#     # field :images, list_of(:image), resolve: assoc(:billing_codes)
#     # field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)
#   end

#   @desc "A department, which belongs to an organization."
#   object :department do
#     field :id, :id
#     field non_null(:name_main), :string
#     field :name_secondary, :string
#     field non_null(:phone_main), :string
#     field :phone_main_ext, :string
#     field :phone_secondary, :string
#     field :phone_secondary_ext, :string
#     field non_null(:email), :string
#     field non_null(:status), :string
#     field :comments, :string, description: "Any additional notes."
#     field :users, list_of(:user), resolve: assoc(:users)
#     # field :images, list_of(:image), resolve: assoc(:billing_codes)
#     field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)
#   end

#   @desc "A user of our system. They belong to a department."
#   object :user do
#     field :id, :id
#     field non_null(:email), :string, description: "The user login"
#     field non_null(:name_first), :string
#     field non_null(:name_last), :string
#     field :phone_main, :string
#     field :phone_main_ext, :string
#     field non_null(:status), :string
#     field non_null(:roles_mask), :int
#     field non_null(:sign_in_count), :int
#     field :current_sign_in_at, :int
#     field :last_sign_in_at, :int
#     field :current_sign_in_ip, :string
#     field :last_sign_in_ip, :string
#     field :departments, list_of(:department), resolve: assoc(:departments)
#   end

#   object :billing_code do
#     field :id, :id
#     field non_null(:name), :string
#   end

#   object :subscription do
#     field :id, :id
#     field non_null(:start_date), :string
#     field non_null(:end_date), :string
#   end

  

  


# end