defmodule PeepgApi.AnalysisPresetTest do
  use PeepgApi.ModelCase

  alias PeepgApi.AnalysisPreset

  @valid_attrs %{name: "some content", settings: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AnalysisPreset.changeset(%AnalysisPreset{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AnalysisPreset.changeset(%AnalysisPreset{}, @invalid_attrs)
    refute changeset.valid?
  end
end
