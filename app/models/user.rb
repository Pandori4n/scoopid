class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lost_people, dependent: :destroy
  has_many :feed_infos
  has_many :search_party_attendancies
  has_many :volunteer_chatrooms, class_name: 'Chatroom', foreign_key: 'volunteer_id'
  has_many :host_chatrooms, class_name: 'Chatroom', foreign_key: 'host_id'
  has_many :messages, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
