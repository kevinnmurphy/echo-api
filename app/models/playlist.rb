class Playlist < ApplicationRecord
    has_many :user_playists
    has_many :users, through: :user_playlists
    
    validates :name, :description, presence: true
    validates :playlist_id, uniqueness: true
end
