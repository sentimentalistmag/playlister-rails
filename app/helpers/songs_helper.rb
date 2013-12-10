module SongsHelper
  def show_song_label (song)
    html =  "<td>#{song.title}- by #{song.artist.name}"
    html += " #{song.artist.record_label}" if song.artist.record_label.downcase.include? "epic"
    html += "</td>"
    html
  end

end