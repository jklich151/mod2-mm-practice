class MovieActorsController < ApplicationController
  def create
    movie = Movie.find(params[:id])
    actor = Actor.find_by(name: params[:Name])
    movie_actor = MovieActor.create(movie_id: movie.id, actor_id: actor.id)

    redirect_to "/movies/#{movie.id}"
  end
end
