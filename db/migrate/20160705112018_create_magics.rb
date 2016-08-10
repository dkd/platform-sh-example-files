class CreateMagics < ActiveRecord::Migration
  def change
    create_table :magics do |t|
      t.string :spell

      t.timestamps null: false
    end
  end
end
