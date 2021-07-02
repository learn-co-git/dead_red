class AddSoldStatusToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :sold_status, :boolean
  end
end
