class Artist < ActiveRecord::Base
        ##rails 3 has this
        #attr_accessible :name, :record_label
    has_many :songs

    def add_song (song)
      #song.genre.artists << self
      self.songs<<song


    end

    def genres
      local_genres = []
      songs.each do |song|
        local_genres << song.genre
      end
      local_genres

    end

end
