class Movie < ApplicationRecord
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  belongs_to :studio

  def actors_by_age
    actors.order(:age)
  end

  def actors_average_age
    actors.average(:age)
  end
end
