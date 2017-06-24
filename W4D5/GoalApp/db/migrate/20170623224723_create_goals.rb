class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.string :body, null: false
      t.boolean :priv_flag, default: false

      t.timestamps
    end
    add_index :goals, :user_id
  end
end
