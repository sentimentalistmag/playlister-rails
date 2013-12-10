require_relative '../spec_helper'

describe 'song features' do
  it "can create songs" do
    #named routes have paths
    visit new_song_path
      fill_in 'Title', with: 'Yonkers'
      fill_in 'Artist', with: 'Tyler The Creator'
      fill_in 'Genre', with: 'Hip Hop'
      click_button 'Create Song'
      expect(page).to  have_content("Song was successfully created")
      song = Song.find_by(title:'Yonkers')

      expect(song.artist.name).to eq('Tyler The Creator')
      expect(song.genre.name).to eq('Hip Hop')
  end
end