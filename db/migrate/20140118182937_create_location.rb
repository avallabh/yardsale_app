class CreateLocation < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false

      t.timestamps
    end
  end
end
