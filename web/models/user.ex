defmodule PeepgApi.User do
  use PeepgApi.Web, :model

  schema "users" do
    field :name_first, :string
    field :name_last, :string
    field :phone_main, :string
    field :phone_main_ext, :string
    field :email, :string
    field :status, :string
    field :role, :string
    has_many :posts, PeepgApi.Post
    belongs_to :department, PeepgApi.Department

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name_first, :name_last, :phone_main, :phone_main_ext, :email, :status, :role])
    |> validate_required([:name_first, :name_last, :phone_main, :phone_main_ext, :email, :status, :role])
  end
end
