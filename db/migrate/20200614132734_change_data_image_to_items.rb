class ChangeDataImageToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :image, :string
  end
end
