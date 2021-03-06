defmodule PeepgApi.UserResolver do
  alias PeepgApi.Repo
  alias PeepgApi.User
  
  def login(params, _info) do
    with {:ok, user} <- PeepgApi.Session.authenticate(params, Repo),
        {:ok, jwt, _ } <- Guardian.encode_and_sign(user, :access) do
      {:ok, %{token: jwt}}
    end
  end

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

  def update(%{id: id, user: user_params}, _info) do
    Repo.get!(User, id)
    |> User.update_changeset(user_params)
    |> Repo.update
  end

  def delete(%{id: id}, _info) do
    user = Repo.get!(User, id)
    Repo.delete(user)
  end
end