class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.references :user, foreign_key: true
      t.string :listing_id

      t.timestamps
    end
  end
end
