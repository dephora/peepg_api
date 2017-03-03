defmodule PeepgApi.PostResolver do
  alias PeepgApi.Repo
  alias PeepgApi.Post

  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end
end