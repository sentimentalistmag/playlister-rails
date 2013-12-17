module SongsHelper
  def show_song_label (song)
    begin
      html =  "<td>#{song.title}- by #{song.artist.name}"
      if song.artist.nil? == false  && song.artist.record_label.nil? == false
        html += " #{song.artist.record_label}" if song.artist.record_label.downcase.include? "epic"
      end
      html += "</td>"
    rescue
    end
    html
  end

end