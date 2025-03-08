class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.integer :priority, default: 3
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
