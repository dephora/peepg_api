defmodule PeepgApi.PlanResolver do
  alias PeepgApi.Repo
  alias PeepgApi.Plan

  def all(_args, _info) do
    {:ok, Repo.all(Plan)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(Plan, id) do
      nil -> {:error, "Plan id #{id} not found"}
      plan -> {:ok, plan}
    end
  end

  def create(args, _info) do
    changeset = Plan.changeset(%Plan{}, args)

    case Repo.insert(changeset) do
      {:ok, plan} -> {:ok, plan}
      {:error, changeset} -> {:error, inspect(changeset.errors)}
    end
  end

  def update(%{id: id, plan: plan_params}, _info) do
    Repo.get!(Plan, id)
    |> Plan.changeset(plan_params)
    |> Repo.update
  end

  def delete(%{id: id}, _info) do
    plan = Repo.get!(Plan, id)
    Repo.delete(plan)
  end

  
end