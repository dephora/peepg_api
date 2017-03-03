defmodule PeepgApi.Schema do
  use Absinthe.Schema
  import_types PeepgApi.Schema.Types

  query do
    field :posts, list_of(:post) do
      resolve &PeepgApi.PostResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &PeepgApi.UserResolver.find/2
    end

    field :users, list_of(:user) do
      resolve &PeepgApi.UserResolver.all/2
    end
  end
end