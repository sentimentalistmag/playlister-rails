class Genre < ActiveRecord::Base
  has_many :artists
  has_many :songs

  def artists

    local_artists = []
    songs.each do |song|
         local_artists << song.artist
    end
    local_artists

  end
end
