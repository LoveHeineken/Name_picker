class Group < ActiveRecord::Base
  paginates_per 10
  belongs_to :company
  has_many :users, :dependent => :destroy

  validates :name, presence: true, length: {maximum: AVAILABLE_SHORT_STRING_LENGTH}
end
