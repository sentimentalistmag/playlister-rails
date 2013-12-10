require 'spec_helper'

describe Genre do
  it "has a name" do
    genre = Genre.create(:name=>"Hip-Hop")
    expect(genre.name).to eq("Hip-Hop")

  end

  it "has many artists" do
    genre = Genre.create(:name=>"Indie Pop")
    cassie = Artist.create(:name=>"Cassie")
    song = Song.create(:title=>"Boom Bop", :genre=>genre)
    cassie.add_song song
    autre = Artist.create(:name=>"Autre")
    song_autre = Song.create(:title=>"Ne Ve Ut", :genre=>genre)
    autre.add_song song_autre
    expect(genre.artists.count).to eq(2)

  end

  it "has many songs" do
    genre = Genre.create(:name=>"Witch House")
    heyhey = Song.create(:title=>"Hey hey, my my", :genre=>genre)
    sick = Song.create(:title=>"Six Sick Six", :genre=>genre)
    expect(genre.songs.count).to eq(2)
  end




end
