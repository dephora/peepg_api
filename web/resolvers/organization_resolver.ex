defmodule PeepgApi.OrganizationResolver do
  alias PeepgApi.Repo
  alias PeepgApi.Organization

  def all(_args, _info) do
    {:ok, Repo.all(Organization)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(Organization, id) do
      nil -> {:error, "Organization id #{id} not found"}
      organization -> {:ok, organization}
    end
  end

  def create(args, _info) do
    changeset = Organization.changeset(%Organization{}, args)

    case Repo.insert(changeset) do
      {:ok, organization} -> {:ok, organization}
      {:error, changeset} -> {:error, inspect(changeset.errors)}
    end
  end
end