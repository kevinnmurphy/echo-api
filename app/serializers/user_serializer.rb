class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :user_id, :name, :pic_url
  
  has_many :user_playlists
  has_many :playlists, through: :user_playlists
end
