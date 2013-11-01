class User < ActiveRecord::Base
  has_many :name_cards
  belongs_to :group
end
