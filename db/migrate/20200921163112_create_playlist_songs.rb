class CreatePlaylistSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :playlist_songs do |t|
      t.integer :position

      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
