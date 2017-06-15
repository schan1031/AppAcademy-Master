class AddColorToCats < ActiveRecord::Migration[5.0]
  def change
    add_column :cats, :color, :string
  end
end
