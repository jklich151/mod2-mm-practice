require 'rails_helper'

RSpec.describe "Actors Show Page" do
  it "can see actor info and movies they've been in" do
    studio_1 = Studio.create(name: "Warner Brothers")
    actor_1 = Actor.create(name: "Daniel Radcliffe",
                          age: 16)
    movie_1 = Movie.create(name: "Harry Potter 1",
                          creation_year: 2003,
                          genre: "magic",
                          studio: studio_1)
    movie_2 = Movie.create(name: "Harry Potter 2",
                          creation_year: 2005,
                          genre: "magic",
                          studio: studio_1)
    movie_1.actors << actor_1
    movie_2.actors << actor_1
    # MovieActor.create(movie: movie_1, actor: actor_1)
    # actor_1.movies << movie_1
    # actor_1.movies << movie_2

    visit "/actors/#{actor_1.id}"

    expect(page).to have_content("Name: Daniel Radcliffe")
    expect(page).to have_content("Age: 16")
    expect(page).to have_content("Harry Potter 1")
    expect(page).to have_content("Harry Potter 2")
  end
end
