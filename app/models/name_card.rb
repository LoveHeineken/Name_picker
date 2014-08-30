class NameCard < ActiveRecord::Base
  paginates_per 10
  belongs_to :user

  validates :name, presence: true, length: {maximum: AVAILABLE_TEXT_LENGTH}
  validates :address, presence: true, length: {maximum: AVAILABLE_LONG_STRING_LENGTH}
  validates :url, presence: true, length: {maximum: 30}, format: URI.regexp(['http', 'https'])
  validates :tel, format: {with: /\A[0-9]{2,4}-[0-9]{2,4}-[0-9]{4}\Z/}
  validates :fax, format: {with: /\A[0-9]{2,4}-[0-9]{2,4}-[0-9]{4}\Z/}
end
