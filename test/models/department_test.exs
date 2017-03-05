defmodule PeepgApi.DepartmentTest do
  use PeepgApi.ModelCase

  alias PeepgApi.Department

  @valid_attrs %{comments: "some content", email: "some content", name: "some content", phone_main: "some content", phone_main_ext: "some content", phone_secondary: "some content", phone_secondary_ext: "some content", status: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Department.changeset(%Department{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Department.changeset(%Department{}, @invalid_attrs)
    refute changeset.valid?
  end
end
