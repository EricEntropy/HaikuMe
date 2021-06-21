class CreateHaikus < ActiveRecord::Migration[6.1]
  def change
    create_table :haikus do |t|
      t.string :title
      t.string :theme
      t.text :content

      t.timestamps
    end
  end
end
