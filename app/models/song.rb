class Song < ActiveRecord::Base
    belongs_to :artist  #song has an artist id
    
    #reader
    def artist_name
       self.artist.name unless self.artist.nil? 
    end
    #can do like this
    #attr_accessor :artist_name
    #but that doesn't get the whole connection of song to artist
    def artist_name=(artist_name)
        @artist_name = artist_name
        # this is the dumb way where we create each time
        # self.artist = Artist.create(:name => artist_name) 
        # this is nice and neat an upsert
        self.artist = Artist.find_or_create_by(:name => artist_name) 
    end
    
end
