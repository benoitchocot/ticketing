class AddPriorityAndStatusToTickets < ActiveRecord::Migration[8.0]
  def change
    add_reference :tickets, :priority, null: false, foreign_key: true
    add_reference :tickets, :status, null: false, foreign_key: true
  end
end
