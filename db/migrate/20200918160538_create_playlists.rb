class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :playlist_id
      t.string :name
      t.text :description
      t.string :pic_url

      t.timestamps
    end
  end
end
