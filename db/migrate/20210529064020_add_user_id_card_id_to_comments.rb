class AddUserIdCardIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :user
    add_reference :comments, :card
  end
end
