require 'spec_helper'

describe Song do
    it "has a title" do
        song = Song.create(:title=>"Guillotine")
        expect(Song.find_by(:title=>"Guillotine")).to eq(song)
    end
    
    it "belongs to an artist" do
        artist = Artist.new(:name => "Death Grips")
        song = Song.new(:title => "Guillotine")
        song.artist = artist
        expect(song.artist.name).to eq("Death Grips")
    end
    
    it "can assign an artist by name" do
        #:artist_name= is a method of Song that assigns creates an artist with the name in the value "Frank Sinatra" and assigns it to the songs artist
        song = Song.new(:title => "Blue Eyes", :artist_name => "Frank Sinatra")
        artist = Artist.find_by(:name=> "Frank Sinatra")
        expect(artist.name).to eq("Frank Sinatra")
        expect(song.artist).to eq(artist)
    end
    
    it "finds artist if exists by name instead of create" do
        artist = Artist.create(name: "Libertines")
        expect(Artist.all.count).to eq(1)
        
        song = Song.create(title: "Fuck Forever", artist_name: "Libertines")
        expect(song.artist).to eq(artist)
        expect(Artist.all.count).to eq(1)
    end
    
    it "knows its artist name" do
        song = Song.create(:title=> "Fuck Forever", :artist_name=> "Libertines")
        expect(song.artist_name).to eq("Libertines")
    end

  it "has a genre" do

    song = Song.new(title: "Rap God")
    song.genre = Genre.new(name: "Rap")
    expect(song.genre.name).to eq("Rap")
  end

  it "It requires a title (can't be an empty)" do
    song = Song.new
    expect(song.valid?).to eq(false)
    #the rest o this test is unnecessary
    song.save
    puts song.errors.to_yaml
    expect(Song.all.count).to eq(0)
  end
  #pending "add some examples to (or delete) #{__FILE__}"
end
