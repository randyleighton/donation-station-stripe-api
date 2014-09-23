class Nonprofit < ActiveRecord::Base
  validates :name, presence: true

  has_many :donations
end
