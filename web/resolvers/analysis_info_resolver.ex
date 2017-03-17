defmodule PeepgApi.AnalysisInfoResolver do
  alias PeepgApi.Repo
  alias PeepgApi.AnalysisInfo

  def all(_args, _info) do
    {:ok, Repo.all(AnalysisInfo)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(AnalysisInfo, id) do
      nil -> {:error, "Analysis Info id #{id} not found"}
      analysis_info -> {:ok, analysis_info}
    end
  end

  def create(args, _info) do
    changeset = AnalysisInfo.changeset(%AnalysisInfo{}, args)

    case Repo.insert(changeset) do
      {:ok, analysis_info} -> {:ok, analysis_info}
      {:error, changeset} -> {:error, inspect(changeset.errors)}
    end
  end

  def update(%{id: id, analysis_info: analysis_info_params}, _info) do
    Repo.get!(AnalysisInfo, id)
    |> AnalysisInfo.changeset(analysis_info_params)
    |> Repo.update
  end

  def delete(%{id: id}, _info) do
    analysis_info = Repo.get!(AnalysisInfo, id)
    Repo.delete(analysis_info)
  end
end