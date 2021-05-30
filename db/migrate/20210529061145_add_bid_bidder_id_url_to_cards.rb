class AddBidBidderIdUrlToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :bid, :integer
    add_column :cards, :bidderId, :integer
    add_column :cards, :url, :string
    add_reference :cards, :user
  end
end
