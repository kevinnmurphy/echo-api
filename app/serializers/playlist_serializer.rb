class PlaylistSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :description, :pic_url, :updated_at 

  has_many :user_playlists
  has_many :users, through: :user_playlists

  has_many :playlist_songs
end
