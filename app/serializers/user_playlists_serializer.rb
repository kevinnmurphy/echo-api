class UserPlaylistsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :updated_at 
  
  belongs_to :user
  belongs_to :playlist
end
