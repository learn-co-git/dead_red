class AddSessionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :session, :string
  end
end
