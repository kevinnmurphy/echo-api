class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :name, :picture
  has_many: :playlists
  has_many: :songs, through: :playlists
end
