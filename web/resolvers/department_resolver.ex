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

  def create(args, _info) do
    changeset = Department.changeset(%Department{}, args)

    case Repo.insert(changeset) do
      {:ok, department} -> {:ok, department}
      {:error, changeset} -> {:error, inspect(changeset.errors)}
    end
  end

  def update(%{id: id, department: department_params}, _info) do
    Repo.get!(Department, id)
    |> Department.changeset(department_params)
    |> Repo.update
  end

  def delete(%{id: id}, _info) do
    department = Repo.get!(Department, id)
    Repo.delete(department)
  end
end