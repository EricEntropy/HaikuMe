class CreateHaikus < ActiveRecord::Migration[6.1]
  def change
    create_table :haikus do |t|
      t.string :title
      t.string :theme
      t.text :content
      t.integer :user_id
      t.timestamps
    end
  end
end
