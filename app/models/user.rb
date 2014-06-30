class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

	has_many :bookmarks, dependent: :destroy
  	has_many :user_votes,dependent: :destroy
	has_many :bookmarks, through: :user_votes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable,:lockable

  #attr_accessible :email, :password, :password_confirmation,:remember_me,:username
  validates :username,presence: true


end
