defmodule PeepgApi.BillingCodeTest do
  use PeepgApi.ModelCase

  alias PeepgApi.BillingCode

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = BillingCode.changeset(%BillingCode{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = BillingCode.changeset(%BillingCode{}, @invalid_attrs)
    refute changeset.valid?
  end
end
