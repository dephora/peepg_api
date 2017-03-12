defmodule PeepgApi.Schema do
  use Absinthe.Schema
  import_types PeepgApi.Schema.Types
  # will need to do multiple imports of all the type files 
  # once they are broken up

  # mutation do

  #   @desc "Create a user"
  #   field: user, type: user do
  #     arg :email, non_null(:string)
  #     arg :name_first, non_null(:string)
  #     arg :name_last, non_null(:string)
  #     arg :phone_main, :string
  #     arg :phone_main_ext, :string
  #     arg :status, non_null(:string)
  #     arg :roles_mask, non_null(:int)

  #     resolve &PeepgApi.UserResolver.create/2
    
  # end

  #   @desc "Create an organization"
  #   field: user, type: user do
  #     arg :name_first, non_null(:string)
  #     arg :name_secondary, :string
  #     arg :phone_main, :string
  #     arg :email, non_null(:string)
  #     arg :phone_main_ext, :string
  #     arg :status, non_null(:string)
  #     arg :roles_mask, non_null(:int)

  #     resolve &PeepgApi.UserResolver.create/2
  #   end
  # end

  query do

    @desc "Get a list of users"
    field :users, list_of(:user) do
      resolve &PeepgApi.UserResolver.all/2
    end

    @desc "Get a single user by ID"
    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &PeepgApi.UserResolver.find/2
    end

    @desc "Get all departments"
    field :departments, list_of(:department) do
      resolve &PeepgApi.DepartmentResolver.all/2
    end

    @desc "Get a department by ID"
    field :department, type: :department do
      arg :id, non_null(:id)
      resolve &PeepgApi.DepartmentResolver.find/2
    end

    @desc "Get an organization by ID"
    field :organization, type: :organization do
      arg :id, non_null(:id)
      resolve &PeepgApi.OrganizationResolver.find/2
    end

    @desc "Get all organizations"
    field :organizations, list_of(:organization) do
      resolve &PeepgApi.OrganizationResolver.all/2
    end

  end
end