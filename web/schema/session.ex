defmodule PeepgApi.Schema.Session do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PeepgApi.Repo

  @desc "A virtual type that represents a session so that we can return a JWT to the user after a successful login. We can store various session data in this type."
  object :session do
    field :token, :string
  end

end