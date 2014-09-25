class Transfer < ActiveRecord::Base
  validates :amount, presence: true

  belongs_to :nonprofit
end
