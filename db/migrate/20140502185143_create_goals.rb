class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :description
      t.boolean :completed, null: false, default: false
      t.boolean :public, null: false, default: false

      t.timestamps
    end
    add_index :goals, :user_id
  end
end
