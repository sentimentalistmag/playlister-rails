class ArtistsSerializer < ActiveModel::Serializer
  attributes :id , :name, :record_label, :song_names  , :this_other_thing

  def this_other_thing
    "I AM ROCKSTAR"
  end
end
