class RemoveUserIdFromTickets < ActiveRecord::Migration[8.0]
  def change
    remove_column :tickets, :user_id, :integer
  end
end
