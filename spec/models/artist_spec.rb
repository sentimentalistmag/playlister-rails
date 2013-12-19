require 'spec_helper'

describe Artist do
    it "has a name and record label" do
        #artist = Artist.create(:name=>'White Ring', :record_label=>'RiotGirrrl')
        artist = FactoryGirl.create(:artist, :name=>"White Ring")
        expect(Artist.all.count).to eq(1)
        ##rails 3 had 
        # Artist.find_by_name
        #straight up SQL
        like = Artist.find_by("name like '%white%'")
        found = Artist.find_by(:name=>'White Ring') #.order.group.etc #arel
        expect(found).to eq(artist)
        expect(like).to eq(found)
        
        
        
        #artist = Artist.new
        ##one way
        #artist.name = "Araab Muzik"
        #artist.record_label = "$ton"
        ##save this data into our db
        #artist.save
        #arist.id
        ##mass assignment
        #artist = Artist.new(:name=>'Aaeon Flow', :record_label=>'Indie')
        ##still need 
        #artist.save
        #arist.id
        ##create and save, create is an active record method
        ##if create fails artist will exist but will not be saved
        #artist = Artist.create(:name=>'White Ring', :record_label=>'RiotGirrrl')
        #arist.id 
    end
    
    it "has songs" do
        artist = Artist.new(:name => "Bob Marley")
        song = Song.new(:title=> "Ganja")
        artist.songs << song
        #have to save because artist.songs is lazy loaded
        artist.save
        expect(artist.songs.count).to eq(1)
        expect(artist.songs.first.title).to eq(song.title)
    end

    it "has genres"  do
      genre = Genre.new(:name=>"reggae")
      artist = Artist.new(:name => "Bob Marley")
      song = Song.new(:title=> "Ganja", :genre=>genre)
      artist.songs << song
      remix_song = Song.new(:title=>"Ganja (Prodigy Remix)", :genre_name=>"trip hop")
      artist.songs << song
      artist.save
      expect(artist.genres.count).to eq(2)
    end

    it "can have a collection of songs added"  do
      artist = Artist.new(:name=>"Smiths")
      song_names = ['Misery', 'Beauty of Midnight', 'Coffin For Me', 'Tears']
      artist.song_names = song_names
      artist.save
      expect(artist.songs.count).to eq(4)
      expect(artist.songs.map { |m| m.title }).to include("Tears")
    end

  it "has a slugified name" do
    artist = Artist.new()
    artist.name = "New Order"
    artist.save
    expect(artist.slug).to eq("new-order")
  end

  it "can find artists for a given genre" do
    artist = Artist.create(name:"Prince!")
    artist.songs.build(title: "Untitled", genre_name:"Pop")
    artist.songs.build(title: "Purple", genre_name:"Pop")
    artist2 = Artist.create(name:"Run DMC")
    a = Artist.find_by_genre("Pop")
    #expect(a).to eq(artist)
    expect(a.count).to eq(1)


  end

  it "can find artists that have a record label" do
    artist = Artist.create(name:"Prince!", record_label: "Astra")

    artist2 = Artist.create(name:"Run DMC", record_label: "Epic")

    artist3 = Artist.create(name:"Circle Jerks")

    artists = Artist.with_record_labels()

    expect(artists.count).to eq(2)


  end

  it "has genres"  do
    artist = Artist.create(name:"Prince!")
    artist.songs.build(title: "Untitled", genre_name:"Pop")
    artist.songs.build(title: "Purple", genre_name:"Pop")
    artist.save
    expect(artist.genres.count).to eq(2)
    expect(artist.genres).contains Genre.find_by(name:"Pop")
  end
  #pending "add some examles to (or delete) #{__FILE__}"
end
