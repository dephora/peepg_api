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
end