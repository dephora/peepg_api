defmodule PeepgApi.ImageResolver do
  alias PeepgApi.Repo
  alias PeepgApi.Image

  def all(_args, _info) do
    {:ok, Repo.all(Image)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(Image, id) do
      nil -> {:error, "Image id #{id} not found"}
      image -> {:ok, image}
    end
  end

  # def create(args, _info) do
  #   changeset = Image.changeset(%Image{}, args)

  #   case Repo.insert(changeset) do
  #     {:ok, image} -> {:ok, image}
  #     {:error, changeset} -> {:error, inspect(changeset.errors)}
  #   end
  # end

  def update(%{id: id, image: image_params}, _info) do
    Repo.get!(Image, id)
    |> Image.changeset(image_params)
    |> Repo.update
  end

  def delete(%{id: id}, _info) do
    image = Repo.get!(Image, id)
    Repo.delete(image)
  end
end