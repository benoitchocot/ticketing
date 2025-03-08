class AddEndDateToTickets < ActiveRecord::Migration[8.0]
  def change
    add_column :tickets, :end_date, :datetime
  end
end
