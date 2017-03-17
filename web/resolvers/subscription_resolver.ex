defmodule PeepgApi.SubscriptionResolver do
  alias PeepgApi.Repo
  alias PeepgApi.Subscription

  def all(_args, _info) do
    {:ok, Repo.all(Subscription)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(Subscription, id) do
      nil -> {:error, "Subscription id #{id} not found"}
      subscription -> {:ok, subscription}
    end
  end

  def create(args, _info) do
    changeset = Subscription.changeset(%Subscription{}, args)

    case Repo.insert(changeset) do
      {:ok, subscription} -> {:ok, subscription}
      {:error, changeset} -> {:error, inspect(changeset.errors)}
    end
  end

  def update(%{id: id, subscription: subscription_params}, _info) do
    Repo.get!(Subscription, id)
    |> Subscription.changeset(subscription_params)
    |> Repo.update
  end

  def delete(%{id: id}, _info) do
    subscription = Repo.get!(Subscription, id)
    Repo.delete(subscription)
  end

  
end