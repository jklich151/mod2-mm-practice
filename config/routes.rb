Rails.application.routes.draw do
get "/studios", to: "studios#index"
get "/actors/:id", to: "actors#show"
get "/movies/:id", to: "movies#show"
post "/movie_actor/:id", to: "movie_actors#create"
end
