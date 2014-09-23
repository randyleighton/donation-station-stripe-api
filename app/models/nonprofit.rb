class Nonprofit < ActiveRecord::Base
  validates :name, presence: true
end
