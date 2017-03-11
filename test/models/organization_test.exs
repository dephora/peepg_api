defmodule PeepgApi.OrganizationTest do
  use PeepgApi.ModelCase

  alias PeepgApi.Organization

  @valid_attrs %{comments: "some content", email_main: "some content", email_secondary: "some content", name_main: "some content", name_secondary: "some content", phone_main: "some content", phone_main_ext: "some content", phone_secondary: "some content", phone_secondary_ext: "some content", remember_inserted_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, status: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Organization.changeset(%Organization{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Organization.changeset(%Organization{}, @invalid_attrs)
    refute changeset.valid?
  end
end
