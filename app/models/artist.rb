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

    def song_names= (names)
      names.each do |song_name|
        #or self.songs.build(:title=>song_name)
        song = Song.find_or_create_by(:title=>song_name)
        self.songs << song
      end
    end

    def song_names
      local_names = []
      songs.each do |song|
        local_names << song.title
      end
      local_names
    end

  #TYPES = %w[band solo]
  #validates :type, :inclusion => {:in=>Artist::TYPE}

end
