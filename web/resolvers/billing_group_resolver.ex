defmodule PeepgApi.BillingGroupResolver do
  alias PeepgApi.Repo
  alias PeepgApi.BillingGroup

  def all(_args, _info) do
    {:ok, Repo.all(BillingGroup)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(BillingGroup, id) do
      nil -> {:error, "Billing Group id #{id} not found"}
      billing_group -> {:ok, billing_group}
    end
  end

end