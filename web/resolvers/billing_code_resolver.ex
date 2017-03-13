defmodule PeepgApi.BillingCodeResolver do
  alias PeepgApi.Repo
  alias PeepgApi.BillingCode

  def all(_args, _info) do
    {:ok, Repo.all(BillingCode)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(BillingCode, id) do
      nil -> {:error, "Billing Code id #{id} not found"}
      billing_code -> {:ok, billing_code}
    end
  end

  def create(args, _info) do
    changeset = BillingCode .changeset(%BillingCode {}, args)

    case Repo.insert(changeset) do
      {:ok, billing_code} -> {:ok, billing_code}
      {:error, changeset} -> {:error, inspect(changeset.errors)}
    end
  end
end