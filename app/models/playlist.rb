class Playlist < ApplicationRecord
    has_many :user_playlists, dependent: :destroy
    has_many :users, through: :user_playlists

    has_many :playlist_songs
    
    validates :name, :description, presence: true
end
