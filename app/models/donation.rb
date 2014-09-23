class Donation < ActiveRecord::Base
  validates :amount, presence: true
  validates :token, presence: true
end
