require 'rails_helper'

RSpec.describe Movie do
  describe "relationships" do
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
    it {should belong_to :studio}
  end

  describe "instance methods" do
    it "#actors_by_age" do
      studio_1 = Studio.create(name: "Warner Brothers")
      actor_1 = Actor.create(name: "Daniel Radcliffe",
                            age: 16)
      actor_2 = Actor.create(name: "Emma Watson",
                            age: 18)
      movie_1 = Movie.create(name: "Harry Potter 1",
                            creation_year: 2003,
                            genre: "magic",
                            studio: studio_1)

      movie_1.actors << actor_1
      movie_1.actors << actor_2

      expect(movie_1.actors_by_age).to eq([actor_1, actor_2])
    end
    it "#actors_average_age" do
      studio_1 = Studio.create(name: "Warner Brothers")
      actor_1 = Actor.create(name: "Daniel Radcliffe",
                            age: 16)
      actor_2 = Actor.create(name: "Emma Watson",
                            age: 18)
      movie_1 = Movie.create(name: "Harry Potter 1",
                            creation_year: 2003,
                            genre: "magic",
                            studio: studio_1)

      movie_1.actors << actor_1
      movie_1.actors << actor_2

      expect(movie_1.actors_average_age).to eq(17)
    end
  end
end
