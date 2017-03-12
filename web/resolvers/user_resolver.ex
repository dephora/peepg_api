defmodule PeepgApi.UserResolver do
  alias PeepgApi.Repo
  alias PeepgApi.User

  def all(_args, _info) do
    {:ok, Repo.all(User)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(User, id) do
      nil -> {:error, "User id #{id} not found"}
      user -> {:ok, user}
    end
  end

  def create(args, _info) do
    changeset = User.changeset(%User{}, args)

    case Repo.insert(changeset) do
      {:ok, user} -> {:ok, user}
      {:error, changeset} -> {:error, inspect(changeset.errors)}
    end
  end
end