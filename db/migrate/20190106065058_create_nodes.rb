class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.string :name
      t.string :sort_order
      t.integer :parent_id

      t.timestamps
    end
  end
end
