class User < ApplicationRecord
    has_many :playlists, dependent: :destroy

    validates :user_id, :name, presence: true
    validates :user_id, uniqueness: true
end
