require 'spec_helper'

describe Genre do
  it "has a name" do
    genre = Genre.create(:name=>"Hip-Hop")
    expect(genre.name).to eq("Hip-Hop")

  end

  it "has many artists" do
    genre = Genre.create(:name=>"Indie Pop")
    cassie = Artist.create(:name=>"Cassie", :genre=>genre)
    autre = Artist.create(:name=>"Autre", :genre_name=>"Indie Pop")
    expect(genre.artists.count).to eq(2)

  end

  it "has many songs" do
    genre = Genre.create(:name=>"With House")
    heyhey = Song.create(:title=>"Hey hey, my my", :genre=>genre)
    sick = Song.create(:title=>"Six Sick Six", :genre=>genre)
    expect(genre.songs.count).to eq(2)
  end




end
