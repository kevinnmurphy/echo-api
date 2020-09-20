class Playlist < ApplicationRecord
    has_many :user_playlists
    has_many :users, through: :user_playlists
    
    validates :name, :description, presence: true
end
