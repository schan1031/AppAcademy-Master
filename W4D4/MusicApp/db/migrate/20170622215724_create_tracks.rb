class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string 'name', null: false
      t.integer 'album_id', null: false
      t.text 'lyrics', null: false
      t.boolean 'bonus', null: false, default: false

      t.timestamps
    end

  end
end
