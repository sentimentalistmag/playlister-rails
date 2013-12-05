class Artist < ActiveRecord::Base
        ##rails 3 has this
        #attr_accessible :name, :record_label
    has_many :songs
end
