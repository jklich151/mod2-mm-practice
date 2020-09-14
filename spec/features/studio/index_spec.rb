require 'rails_helper'

RSpec.describe "Studio Index Page" do
  it "can see a list of all studios and their movies" do
    studio_1 = Studio.create(name: "Warner Brothers")
    studio_2 = Studio.create(name: "Universal")

    movie_1 = Movie.create(name: "Harry Potter 1",
                          creation_year: 2003,
                          genre: "magic",
                          studio: studio_1)
    movie_2 = Movie.create(name: "Harry Potter 2",
                          creation_year: 2005,
                          genre: "magic",
                          studio: studio_1)
    movie_3 = Movie.create(name: "Sing",
                          creation_year: 2016,
                          genre: "animated",
                          studio: studio_2)

    visit "/studios"

    expect(page).to have_content("Warner Brothers")
    expect(page).to have_content("Harry Potter 1")
    expect(page).to have_content("Harry Potter 2")
    expect(page).to have_content("Universal")
    expect(page).to have_content("Sing")
  end
end
