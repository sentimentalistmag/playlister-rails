class Artist < ActiveRecord::Base
        ##rails 3 has this
        #attr_accessible :name, :record_label
    has_many :songs
    has_many :genres, through: :songs

    before_save :sluggify

    def sluggify
      self.slug = self.name.gsub(" ", "-").downcase
    end

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
      Rails.cache.fetch([:artist,self.id,:songs]) do

        local_names = []
        songs.each do |song|
          local_names << song.title
        end
        local_names
      end
    end

    def to_param
      self.sluggify unless self.slug
      self.slug
    end

    def self.find(val)
      if val.to_i != 0
        super val
      else
        find_by(:slug=>val)
      end

    end

  def self.find_by_genre(genre_name)
    #AREL
    #joins(:songs)
    #.joins(:genres)   # Artist doesn't know about genres
    #.where("genres.name ILIKE ?", genre_name)
    #joins("inner join songs on so")
    joins(:songs => :genre)
    .where("genres.name LIKE ?", genre_name)
    #.joins(:genres)   # Artist doesn't know about genres

  end

  def self.with_record_labels()
    where ("record_label is not null")
  end

  def self.with_specific_label(label)
    where(record_label: label)
  end
  #TYPES = %w[band solo]
  #validates :type, :inclusion => {:in=>Artist::TYPE}

end
