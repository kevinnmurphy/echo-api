class CreatePlaylistSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :playlist_songs do |t|
      t.string :position
      t.string :spotify_id

      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
