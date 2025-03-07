class CreatePriorities < ActiveRecord::Migration[8.0]
  def change
    create_table :priorities do |t|
      t.string :title
      t.string :color

      t.timestamps
    end
  end
end
