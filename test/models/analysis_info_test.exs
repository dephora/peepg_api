defmodule PeepgApi.AnalysisInfoTest do
  use PeepgApi.ModelCase

  alias PeepgApi.AnalysisInfo

  @valid_attrs %{analyzed_parts: 42, approval_status: "some content", approval_updated_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, final_grade: 42, metadata: "some content", total_parts: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AnalysisInfo.changeset(%AnalysisInfo{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AnalysisInfo.changeset(%AnalysisInfo{}, @invalid_attrs)
    refute changeset.valid?
  end
end
