require 'securerandom'

class LostPerson < ApplicationRecord
  acts_as_token_authenticatable

  # Note: you can include any module you want. If available,
  # token authentication will be performed before any other
  # Devise authentication method.
  #
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable

  belongs_to :user

  has_many :search_parties
  has_many :feed_infos
  has_many :chatrooms, dependent: :destroy

  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :photo, presence: true
  validates :height, presence: true
  validates :disparition_date_time, presence: true
  after_validation :generate_code, on: :create

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(7)
  end
end
