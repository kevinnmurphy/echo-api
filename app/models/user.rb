class User < ApplicationRecord
    has_many :user_playlists, dependent: :destroy
    has_many :playlists, through: :user_playlists

    # accepts_nested_attributes_for :playlists, reject_if: :all_blank

    validates :name, presence: true
    # validates :email, uniqueness: true
end
