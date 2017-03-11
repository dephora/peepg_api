defmodule PeepgApi.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  # Break this into multiple files 

  object :user do
    field :id, :id
    field :name_first, :string
    field :name_last, :string
    field :email, :string
    field :posts, list_of(:post), resolve: assoc(:posts)
    # field :departments, list_of(:department), resolve: assoc(:posts)
  end

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
    field :user, :user, resolve: assoc(:user)
  end

  object :department do
    field :id, :id
    field :name, :string
    field :phone_main, :string
    field :phone_main_ext, :string
    field :phone_secondary, :string
    field :phone_secondary_ext, :string
    field :email, :string
    field :status, :string
    field :comments, :string
    # field :users, list_of(:user), resolve: assoc(:users)
    # field :images, list_of(:image), resolve: assoc(:billing_codes)
    # field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)
  end

  object :organization do
    field :id, :id
    field :name_main, :string
    field :name_secondary, :string
    field :phone_main, :string
    field :phone_main_ext, :string
    field :phone_secondary, :string
    field :phone_secondary_ext, :string
    field :email, :string
    field :status, :string
    field :comments, :string
    # field :users, list_of(:user), resolve: assoc(:users)
    # field :images, list_of(:image), resolve: assoc(:billing_codes)
    # field :billing_codes, list_of(:billing_code), resolve: assoc(:billing_codes)
  end


end