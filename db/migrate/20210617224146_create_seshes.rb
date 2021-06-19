class CreateSeshes < ActiveRecord::Migration[6.1]
  def change
    create_table :seshes do |t|
      t.integer :user_id
      t.boolean :logged_in

      t.timestamps
    end
  end
end
