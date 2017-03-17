defmodule PeepgApi.AnalysisPresetResolver do
  alias PeepgApi.Repo
  alias PeepgApi.AnalysisPreset

  def all(_args, _info) do
    {:ok, Repo.all(AnalysisPreset)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(AnalysisPreset, id) do
      nil -> {:error, "Analysis Info id #{id} not found"}
      analysis_preset -> {:ok, analysis_preset}
    end
  end

  def create(args, _info) do
    changeset = AnalysisPreset.changeset(%AnalysisPreset{}, args)

    case Repo.insert(changeset) do
      {:ok, analysis_preset} -> {:ok, analysis_preset}
      {:error, changeset} -> {:error, inspect(changeset.errors)}
    end
  end

  def update(%{id: id, analysis_preset: analysis_preset_params}, _info) do
    Repo.get!(AnalysisPreset, id)
    |> AnalysisPreset.changeset(analysis_preset_params)
    |> Repo.update
  end

  def delete(%{id: id}, _info) do
    analysis_preset = Repo.get!(AnalysisPreset, id)
    Repo.delete(analysis_preset)
  end
end