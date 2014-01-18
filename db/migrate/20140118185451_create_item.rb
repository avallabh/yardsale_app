class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :price, null: false
      t.integer :user_id, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :image
      t.boolean :sold, default: false

      t.timestamps
    end
  end
end
