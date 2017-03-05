defmodule PeepgApi.Schema do
  use Absinthe.Schema
  import_types PeepgApi.Schema.Types
  # will need to do multiple imports of all the type files 
  # once they are broken up

  query do

    @desc "Get a post by ID"
    field :post, type: :post do
      arg :id, non_null(:id)
      resolve &PeepgApi.PostResolver.find/2
    end
    
    field :posts, list_of(:post) do
      resolve &PeepgApi.PostResolver.all/2
    end

    @desc "Get a department by ID"
    field :department, type: :department do
      arg :id, non_null(:id)
      resolve &PeepgApi.DepartmentResolver.find/2
    end

    @desc "Get list of departments"
    field :departments, list_of(:department) do
      resolve &PeepgApi.DepartmentResolver.all/2
    end

    @desc "Get a user by ID"
    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &PeepgApi.UserResolver.find/2
    end

    @desc "Get list of users"
    field :users, list_of(:user) do
      resolve &PeepgApi.UserResolver.all/2
    end
  end
end