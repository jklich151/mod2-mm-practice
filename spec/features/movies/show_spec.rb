require 'rails_helper'

RSpec.describe "Movies Show Page" do
  it "can see movies name, creation year and genre" do
    studio_1 = Studio.create(name: "Warner Brothers")
    actor_1 = Actor.create(name: "Daniel Radcliffe",
                          age: 16)
    movie_1 = Movie.create(name: "Harry Potter 1",
                          creation_year: 2003,
                          genre: "magic",
                          studio: studio_1)

    movie_1.actors << actor_1

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content("Harry Potter 1")
    expect(page).to have_content(2003)
    expect(page).to have_content("magic")
  end

  it "can see a list of it's actors from youngest to oldest" do
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

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content("Daniel Radcliffe Emma Watson")
  end

  it "can see the average age of actors" do
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

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content("17")
  end
  it "can add an actor to a movie" do
    studio_1 = Studio.create(name: "Warner Brothers")
    actor_1 = Actor.create(name: "Daniel Radcliffe",
                          age: 16)
    actor_2 = Actor.create!(name: "Emma Watson",
                          age: 18)
    movie_1 = Movie.create(name: "Harry Potter 1",
                          creation_year: 2003,
                          genre: "magic",
                          studio: studio_1)

    movie_1.actors << actor_1

    visit "/movies/#{movie_1.id}"

    fill_in "Name", with: "Emma Watson"

    click_button "Add Actor"

    expect(current_path).to eq("/movies/#{movie_1.id}")
    expect(page).to have_content("Emma Watson")
  end
end
