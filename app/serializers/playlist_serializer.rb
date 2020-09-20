class PlaylistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :picture 
end
