defmodule PeepgApi.Router do
  use PeepgApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/api", PeepgApi do
  #   pipe_through :api
  # end

  pipeline :graphql do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug PeepgApi.Web.Context
  end

  scope "/api" do
    pipe_through :graphql

    forward "/", Absinthe.Plug,
      schema: PeepgApi.Schema
  end
 
  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: PeepgApi.Schema

    
end