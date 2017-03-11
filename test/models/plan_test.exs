defmodule PeepgApi.PlanTest do
  use PeepgApi.ModelCase

  alias PeepgApi.Plan

  @valid_attrs %{active: true, description: "some content", name: "some content", plan_code: "some content", plan_interval_length: 42, plan_interval_unit: "some content", plan_quota: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Plan.changeset(%Plan{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Plan.changeset(%Plan{}, @invalid_attrs)
    refute changeset.valid?
  end
end
