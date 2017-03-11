defmodule PeepgApi.ImageTest do
  use PeepgApi.ModelCase

  alias PeepgApi.Image

  @valid_attrs %{analysis_type: "some content", filename_original: "some content", metadata: "some content", name_original: "some content", name_processed: "some content", processing_stage: "some content", state: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Image.changeset(%Image{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Image.changeset(%Image{}, @invalid_attrs)
    refute changeset.valid?
  end
end
