defmodule PeepgApi.BillingCodeQuotaTest do
  use PeepgApi.ModelCase

  alias PeepgApi.BillingCodeQuota

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = BillingCodeQuota.changeset(%BillingCodeQuota{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = BillingCodeQuota.changeset(%BillingCodeQuota{}, @invalid_attrs)
    refute changeset.valid?
  end
end
