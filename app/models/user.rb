class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lost_people, dependent: :destroy
  has_many :feed_infos
  has_many :search_party_attendancies

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
