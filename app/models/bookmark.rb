class Bookmark < ActiveRecord::Base
	belongs_to :user
	has_many :user_votes ,dependent: :destroy
	has_many :users, through: :user_votes
	validates :title,:description,:url,presence: true

end
