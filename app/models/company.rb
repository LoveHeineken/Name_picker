class Company < ActiveRecord::Base
  has_many :groups
  validates :name, presence: true, length: {maximum: 6}
  validates :url, presence: true, length: {maximum: 30}
  validates :adress, presence: true, length: { maximum: 18 }
  validates :tel, :fax, presence: true, length: { maximum: 13 }, format: { with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/ }
end
