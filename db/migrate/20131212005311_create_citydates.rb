class CreateCitydates < ActiveRecord::Migration
  def change
    create_table :citydates do |t|
      t.string :city
      t.date :date

      t.timestamps
    end
  end
end
