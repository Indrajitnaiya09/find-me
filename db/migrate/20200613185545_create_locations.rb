class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations, id: :uuid do |t|
      t.string :latitude
      t.string :longitude
      t.integer :user_id
      t.integer :access_id
      t.integer :address_id
      
      t.timestamps
    end
  end
end
