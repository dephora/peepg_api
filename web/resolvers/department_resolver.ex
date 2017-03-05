defmodule PeepgApi.DepartmentResolver do
  alias PeepgApi.Repo
  alias PeepgApi.Department

  def all(_args, _info) do
    {:ok, Repo.all(Department)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(Department, id) do
      nil -> {:error, "Department id #{id} not found"}
      department -> {:ok, department}
    end
  end
end