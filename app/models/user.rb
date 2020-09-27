class User < ApplicationRecord
    has_many :user_playlists, dependent: :destroy
    has_many :playlists, through: :user_playlists

    validates :name, presence: true
end
