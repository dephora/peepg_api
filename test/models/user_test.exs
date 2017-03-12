defmodule PeepgApi.UserTest do
  use PeepgApi.ModelCase

  alias PeepgApi.User

  @valid_attrs %{comments: "some content", current_sign_in_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, current_sign_in_ip: "some content", email: "some content", last_sign_in_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, last_sign_in_ip: "some content", name_first: "some content", name_last: "some content", password_hash: "some content", phone_main: "some content", phone_main_ext: "some content", remember_inserted_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, reset_password_sent_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, reset_password_token: "some content", roles_mask: 42, sign_in_count: 42, status: "some content"}
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
