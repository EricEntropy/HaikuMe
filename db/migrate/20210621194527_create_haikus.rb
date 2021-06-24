class CreateHaikus < ActiveRecord::Migration[6.1]
  def change
    create_table :haikus do |t|
      t.string :title
      t.string :line_1
      t.string :line_2
      t.string :line_3
      t.integer :user_id
      t.timestamps
    end
  end
end
