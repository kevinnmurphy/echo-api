class Playlist < ApplicationRecord
    # has_many :playlists, through: :user_playlists
    belongs_to :user
    
    validates :name, :description, presence: true
    validates :playlist_id, uniqueness: true
end
