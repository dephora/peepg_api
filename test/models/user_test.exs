defmodule PeepgApi.UserTest do
  use PeepgApi.ModelCase

  alias PeepgApi.User

  @valid_attrs %{email: "some content", name_first: "some content", name_last: "some content", phone_main: "some content", phone_main_ext: "some content", role: "some content", status: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
