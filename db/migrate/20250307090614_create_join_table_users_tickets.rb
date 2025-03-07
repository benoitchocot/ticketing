class CreateJoinTableUsersTickets < ActiveRecord::Migration[8.0]
  def change
    create_join_table :users, :tickets do |t|
       t.index [:user_id, :ticket_id]
       t.index [:ticket_id, :user_id]
    end
  end
end
