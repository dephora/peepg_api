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
      arg :id, non_null(:id), description: "The ID of the organization."
      resolve &PeepgApi.OrganizationResolver.find/2
    end

    @desc "Get a list of all departments."
    field :departments, list_of(:department) do
      resolve &PeepgApi.DepartmentResolver.all/2
    end

    @desc "Get a single department by ID."
    field :department, type: :department do
      arg :id, non_null(:id), description: "The ID of the department."
      resolve &PeepgApi.DepartmentResolver.find/2
    end

    @desc "Get a list of all users."
    field :users, list_of(:user) do
      resolve &PeepgApi.UserResolver.all/2
    end

    @desc "Get a single user by ID."
    field :user, type: :user do
      arg :id, non_null(:id), description: "The ID of the user."
      resolve &PeepgApi.UserResolver.find/2
    end

    @desc "Get a list of all billing codes."
    field :billing_codes, list_of(:billing_code) do
      resolve &PeepgApi.BillingCodeResolver.all/2
    end

    @desc "Get a single billing code by ID."
    field :billing_code, type: :billing_code do
      arg :id, non_null(:id), description: "The ID of the billing code."
      resolve &PeepgApi.BillingCodeResolver.find/2
    end

    @desc "Get a list of all billing groups."
    field :billing_groups, list_of(:billing_group) do
      resolve &PeepgApi.BillingGroupResolver.all/2
    end

    @desc "Get a single billing group by ID."
    field :billing_group, type: :billing_group do
      arg :id, non_null(:id), description: "The ID of the billing group."
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
      arg :id, non_null(:id), description: "The ID of the plan."
      resolve &PeepgApi.PlanResolver.find/2
    end

    @desc "Get a list of all images."
    field :images, list_of(:image) do
      resolve &PeepgApi.ImageResolver.all/2
    end

    @desc "Get a single image by ID."
    field :image, type: :image do
      arg :id, non_null(:id), description: "The ID of the image."
      resolve &PeepgApi.ImageResolver.find/2
    end

    @desc "Get a list of all analysis infos."
    field :analysis_infos, list_of(:analysis_info) do
      resolve &PeepgApi.AnalysisInfoResolver.all/2
    end

    @desc "Get a single analyis info by ID."
    field :analysis_info, type: :analysis_info do
      arg :id, non_null(:id), description: "The ID of the analysis info."
      resolve &PeepgApi.AnalysisInfoResolver.find/2
    end

    @desc "Get a list of all analysis presets."
    field :analysis_presets, list_of(:analysis_preset) do
      resolve &PeepgApi.AnalysisInfoResolver.all/2
    end

    @desc "Get a single analyis preset by ID."
    field :analysis_preset, type: :analysis_preset do
      arg :id, non_null(:id), description: "The ID of the analysis preset."
      resolve &PeepgApi.AnalysisInfoResolver.find/2
    end
  end

  # if we use non_null, we have to pass in all current fields to update,
  # should we do this and just pass in existing if not modified in the
  # resolver?
  input_object :update_organization_params do
    field :name_main, :string
    field :name_secondary, :string
    field :phone_main, :string
    field :phone_main_ext, :string
    field :phone_secondary, :string
    field :phone_secondary_ext, :string
    field :email_main, :string
    field :email_secondary, :string
    field :status, :string
    field :comments, :string
  end

  input_object :update_department_params do
    field :name_main, :string
    field :name_secondary, :string
    field :phone_main, :string
    field :phone_main_ext, :string
    field :phone_secondary, :string
    field :phone_secondary_ext, :string
    field :email, :string
    field :status, :string
    field :comments, :string
    field :organization_id, :integer
    field :billing_code_id, :integer
  end

  input_object :update_user_params do
    field :id, :id
    field :email, :string
    field :name_first, :string
    field :name_last, :string
    field :phone_main, :string
    field :phone_main_ext, :string
    field :status, :string
    field :comments, :string
    field :roles_mask, :integer
    field :password_hash, :string
    field :department_id, :integer
  end

  mutation do

    #--------------- ORGANIZATION ---------------#
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
      arg :status, non_null(:string)
      arg :comments, :string

      resolve &PeepgApi.OrganizationResolver.create/2
    end

    @desc "Update an organization. Required fields are `name_main`, `phone_main`, `email_main`, `status`."
    field :update_organization, type: :organization do
      arg :id, non_null(:integer)
      arg :organization, :update_organization_params

      resolve &PeepgApi.OrganizationResolver.update/2
    end

    @desc "Delete an organization."
    field :delete_organization, type: :organization do
      arg :id, non_null(:integer)

      resolve &PeepgApi.OrganizationResolver.delete/2
    end
    #--------------- END ORGANIZATION ---------------#

    #--------------- DEPARTMENT ---------------#
    @desc "Create a department. Required fields are `name_main`, `phone_main`, `email_main`, `status`."
    field :create_department, type: :department do
      arg :name_main, non_null(:string)
      arg :name_secondary, :string
      arg :phone_main, non_null(:string)
      arg :phone_main_ext, :string
      arg :phone_secondary, :string
      arg :phone_secondary_ext, :string
      arg :email, non_null(:string)
      # arg :email_secondary, :string
      arg :status, non_null(:string)
      arg :comments, :string
      arg :organization_id, non_null(:integer)
      arg :billing_code_id, non_null(:integer)

      resolve &PeepgApi.DepartmentResolver.create/2
    end

    @desc "Update a department. Required fields are `name_main`, `phone_main`, `email_main`, `status`."
    field :update_department, type: :department do
      arg :id, non_null(:integer)
      arg :department, :update_department_params

      resolve &PeepgApi.DepartmentResolver.update/2
    end

    @desc "Delete an department."
    field :delete_department, type: :department do
      arg :id, non_null(:integer)

      resolve &PeepgApi.DepartmentResolver.delete/2
    end
    #--------------- END DEPARTMENT ---------------#


    #--------------- USER ---------------#
    @desc "Create a user. Required fields are `email`, `name_first`, `name_last`, `status`, `roles_mask`."
    field :create_user, type: :user do
      arg :email, non_null(:string)
      arg :name_first, non_null(:string)
      arg :name_last, non_null(:string)
      arg :phone_main, :string
      arg :phone_main_ext, :string
      arg :status, non_null(:string)
      arg :comments, :string
      arg :roles_mask, non_null(:integer)
      arg :password_hash, non_null(:string)
      arg :department_id, non_null(:integer)

      resolve &PeepgApi.UserResolver.create/2
    end

    @desc "Update a user. Required fields are `email`, `name_first`, `name_last`, `status`, `roles_mask`."
    field :update_user, type: :user do
      arg :id, non_null(:integer)
      arg :user, :update_user_params

      resolve &PeepgApi.UserResolver.update/2
    end

    @desc "Delete a user."
    field :delete_user, type: :user do
      arg :id, non_null(:integer)

      resolve &PeepgApi.UserResolver.delete/2
    end

    #--------------- END USER ---------------#

  end
end