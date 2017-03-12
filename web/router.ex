defmodule PeepgApi.Router do
  use PeepgApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/api", PeepgApi do
  #   pipe_through :api
  # end

  forward "/graphql", Absinthe.Plug,
    schema: PeepgApi.Schema
 
  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: PeepgApi.Schema

    
end