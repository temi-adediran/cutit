class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :browser
      t.integer :version
      t.string :platform
      t.string :os

      t.timestamps null: false
    end
  end
end
