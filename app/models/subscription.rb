class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :nonprofit
  belongs_to :plan
end
