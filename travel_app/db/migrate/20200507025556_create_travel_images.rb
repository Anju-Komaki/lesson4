class CreateTravelImages < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_images do |t|
      t.string :image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
