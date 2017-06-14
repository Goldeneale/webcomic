class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      t.string :title
      t.integer :width
      t.integer :height
      t.integer :page
      t.string :hovertext
      t.text :comment
      t.attachment :image

      t.timestamps null: false
    end
  end
end
