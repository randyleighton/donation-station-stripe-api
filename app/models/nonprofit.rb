class Nonprofit < ActiveRecord::Base
  validates :name, presence: true

  has_many :donations
  has_many :subscriptions
end
