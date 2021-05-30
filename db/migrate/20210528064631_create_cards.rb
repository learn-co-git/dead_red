class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :player_name
      t.string :year
      t.string :brand
      t.string :description
      t.string :price

      t.timestamps
    end
  end
end
