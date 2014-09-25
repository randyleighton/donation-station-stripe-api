class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :nonprofit
  belongs_to :plan

  before_create :create_subscription

  def create_subscription
    Stripe.api_key = ENV["TEST_SECRET"]
    customer = Stripe::Customer.create(
      :card => self.token,
      :plan => self.plan.name,
      :email => self.user.email,
      :description => "#{self.nonprofit.name} Subscription"
    )
  end
end
