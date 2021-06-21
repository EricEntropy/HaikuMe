class CreateHaikuThemes < ActiveRecord::Migration[6.1]
  def change
    create_table :haiku_themes do |t|
      t.integer :haiku_id
      t.integer :theme_id

      t.timestamps
    end
  end
end
