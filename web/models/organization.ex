defmodule PeepgApi.Organization do
  use PeepgApi.Web, :model

  schema "organizaations" do
    field :name_main, :string
    field :name_secondary, :string
    field :phone_main, :string
    field :phone_main_ext, :string
    field :phone_secondary, :string
    field :phone_secondary_ext, :string
    field :email, :string
    field :status, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name_main, :name_secondary, :phone_main, :phone_main_ext, :phone_secondary, :phone_secondary_ext, :email, :status])
    |> validate_required([:name_main, :name_secondary, :phone_main, :phone_main_ext, :phone_secondary, :phone_secondary_ext, :email, :status])
  end
end
