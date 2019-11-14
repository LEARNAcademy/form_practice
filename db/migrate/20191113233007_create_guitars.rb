class CreateGuitars < ActiveRecord::Migration[6.0]
  def change
    create_table :guitars do |t|
      t.string :model
      t.integer :year

      t.timestamps
    end
  end
end
