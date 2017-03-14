defmodule PeepgApi.Schema do
  use Absinthe.Schema
  import_types PeepgApi.Schema.Types
  # will need to do multiple imports of all the type files
  # once they are broken up


  query do

    @desc "Get a list of all organizations."
    field :organizations, list_of(:organization) do
      resolve &PeepgApi.OrganizationResolver.all/2
    end

    @desc "Get a single organization by ID."
    field :organization, type: :organization do
      arg :id, non_null(:id)
      resolve &PeepgApi.OrganizationResolver.find/2
    end

    @desc "Get a list of all departments."
    field :departments, list_of(:department) do
      resolve &PeepgApi.DepartmentResolver.all/2
    end

    @desc "Get a single department by ID."
    field :department, type: :department do
      arg :id, non_null(:id)
      resolve &PeepgApi.DepartmentResolver.find/2
    end

    @desc "Get a list of all users."
    field :users, list_of(:user) do
      resolve &PeepgApi.UserResolver.all/2
    end

    @desc "Get a single user by ID."
    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &PeepgApi.UserResolver.find/2
    end

    @desc "Get a list of all billing codes."
    field :billing_codes, list_of(:billing_code) do
      resolve &PeepgApi.BillingCodeResolver.all/2
    end

    @desc "Get a single billing code by ID."
    field :billing_code, type: :billing_code do
      arg :id, non_null(:id)
      resolve &PeepgApi.BillingCodeResolver.find/2
    end

    @desc "Get a list of all billing groups."
    field :billing_groups, list_of(:billing_group) do
      resolve &PeepgApi.BillingGroupResolver.all/2
    end

    @desc "Get a single billing group by ID."
    field :billing_group, type: :billing_group do
      arg :id, non_null(:id)
      resolve &PeepgApi.BillingGroupResolver.find/2
    end

    # @desc "Get a list of all subscriptions."
    # field :subscriptions, list_of(:subscription) do
    #   resolve &PeepgApi.SubscriptionResolver.all/2
    # end

    # @desc "Get a single subscription code by ID."
    # field :subscription, type: :subscription do
    #   arg :id, non_null(:id)
    #   resolve &PeepgApi.SubscriptionResolver.find/2
    # end

    @desc "Get a list of all plans."
    field :plans, list_of(:plan) do
      resolve &PeepgApi.PlanResolver.all/2
    end

    @desc "Get a single plan by ID."
    field :plan, type: :plan do
      arg :id, non_null(:id)
      resolve &PeepgApi.PlanResolver.find/2
    end

    @desc "Get a list of all images."
    field :images, list_of(:image) do
      resolve &PeepgApi.ImageResolver.all/2
    end

    @desc "Get a single image by ID."
    field :image, type: :image do
      arg :id, non_null(:id)
      resolve &PeepgApi.ImageResolver.find/2
    end

    @desc "Get a list of all analysis infos."
    field :analysis_infos, list_of(:analysis_info) do
      resolve &PeepgApi.AnalysisInfoResolver.all/2
    end

    @desc "Get a single analyis info by ID."
    field :analysis_info, type: :analysis_info do
      arg :id, non_null(:id)
      resolve &PeepgApi.AnalysisInfoResolver.find/2
    end

    @desc "Get a list of all analysis presets."
    field :analysis_presets, list_of(:analysis_preset) do
      resolve &PeepgApi.AnalysisInfoResolver.all/2
    end

    @desc "Get a single analyis preset by ID."
    field :analysis_preset, type: :analysis_preset do
      arg :id, non_null(:id)
      resolve &PeepgApi.AnalysisInfoResolver.find/2
    end
  end

  @desc "Test"
  mutation do
    @desc "Create an organization. Required fields are `name_main`, `phone_main`, `email_main`, `status`."
    field :create_organization, type: :organization do
      arg :name_main, non_null(:string)
      arg :name_secondary, :string
      arg :phone_main, non_null(:string)
      arg :phone_main_ext, :string
      arg :phone_secondary, :string
      arg :phone_secondary_ext, :string      
      arg :email_main, non_null(:string)
      arg :email_secondary, :string
      arg :phone_main_ext, :string
      arg :status, non_null(:string)
      arg :comments, :string     

      resolve &PeepgApi.OrganizationResolver.create/2
    end

    # @desc "Create a user"
    # field: user, type: user do
    #   arg :email, non_null(:string)
    #   arg :name_first, non_null(:string)
    #   arg :name_last, non_null(:string)
    #   arg :phone_main, :string
    #   arg :phone_main_ext, :string
    #   arg :status, non_null(:string)
    #   arg :roles_mask, non_null(:int)

    #   resolve &PeepgApi.UserResolver.create/2
    # end

  end
end