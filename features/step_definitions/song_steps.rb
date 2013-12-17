Given (/^I am on the add songs page$/) do
  visit new_song_path
end

When(/^I add "(.*?)"$/) do |song_name|
  fill_in "Title", with: song_name
  click_on "Create Song"
end

Then (/^I should see "(.*?)"/s)    do |song_name|
  within ("#song_partial_list")   do


  end
end