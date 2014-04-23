class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :text
      t.decimal :price

      # this line adds an integer column called 'menu_id'.
      t.references :menu, index: true
      
      t.timestamps
    end
  end
end
