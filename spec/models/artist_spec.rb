require 'spec_helper'

describe Artist do
    it "has a name and record label" do
        artist = Artist.create(:name=>'White Ring', :record_label=>'RiotGirrrl')
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
  #pending "add some examples to (or delete) #{__FILE__}"
end
