require 'securerandom'

class LostPerson < ApplicationRecord
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search, against: [:code, :last_known_location, :first_name, :last_name]
  pg_search_scope :search_by_code, against: :code
  pg_search_scope :search_by_location,
                  against: :last_known_location,
                  using: {
                    trigram: {
                      word_similarity: true,
                      threshold: 0.1
                    },
                    tsearch: {
                      prefix: true
                    }
                  }
  pg_search_scope :search_by_full_name,
                  against: [:first_name, :last_name],
                  using: {
                    trigram: {
                      word_similarity: true,
                      threshold: 0.1
                    },
                    tsearch: {
                      prefix: true
                    }
                  }
  # pg_search_scope :search_by_authentication_token, against: :authentication_token

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

  def self.perform_search(keyword)
    if keyword.present?
      LostPerson.search(keyword)
    else
      LostPerson.all
    end.sorted
  end

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(7)
  end
end
