class Client < ApplicationRecord
  has_many :expenses

  validates :first_name, presence: true
  validates :last_name, presence: true
end
