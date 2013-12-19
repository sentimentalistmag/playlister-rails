class Song < ActiveRecord::Base
    belongs_to :artist , touch:true #song has an artist id , touch true means that updates to artist which is a related model will update the dependent
    belongs_to :genre  #song has a  genre id

    validates :title, :presence => {:message=> "Every song has a name, enter one even if it's Untitled"  }
    #after_save fires only after a .save, after_commit is fired after every successful DB operation
    after_commit :invalidate_cache

    def invalidate_cache
      Rails.cache.clear([:artist,self.artist_id, :songs])
    end
    #reader for genre name
    def genre_name
      self.genre.name unless self.genre.nil?
    end

    def genre_name=(genre_name)
      #implicit instance variable
      @genre_name = genre_name
      #this is an upsert
      self.genre = Genre.find_or_create_by(:name=>genre_name)

    end
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
