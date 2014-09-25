class Transfer < ActiveRecord::Base
  validates :amount, presence: true
end
