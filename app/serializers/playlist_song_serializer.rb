class PlaylistSongSerializer
  include FastJsonapi::ObjectSerializer
  attributes :position, :spotify_id
end
