class RemovePriorityAndStatusFromTickets < ActiveRecord::Migration[8.0]
  def change
    remove_column :tickets, :priority
    remove_column :tickets, :status
  end
end
