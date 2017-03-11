defmodule PeepgApi.BillingCodeGroupTest do
  use PeepgApi.ModelCase

  alias PeepgApi.BillingCodeGroup

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = BillingCodeGroup.changeset(%BillingCodeGroup{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = BillingCodeGroup.changeset(%BillingCodeGroup{}, @invalid_attrs)
    refute changeset.valid?
  end
end
