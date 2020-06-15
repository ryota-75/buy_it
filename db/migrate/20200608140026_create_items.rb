class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :store
      t.string :item_name
      t.integer :price
      t.text :text
      t.text :image
      t.timestamps
    end
  end
end
