defmodule PeepgApi.Team do
  use PeepgApi.Web, :model

  schema "teams" do
    field :name, :string
    field :phone_main, :string
    field :phone_main_ext, :string
    field :phone_secondary, :string
    field :phone_secondary_ext, :string
    field :email, :string
    field :status, :string
    field :comments, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :phone_main, :phone_main_ext, :phone_secondary, :phone_secondary_ext, :email, :status, :comments])
    |> validate_required([:name, :phone_main, :phone_main_ext, :phone_secondary, :phone_secondary_ext, :email, :status, :comments])
  end
end
