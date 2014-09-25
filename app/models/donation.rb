class Donation < ActiveRecord::Base
  validates :amount, presence: true
  validates :token, presence: true
  belongs_to :nonprofit
  belongs_to :user
  before_save :make_some_cents
  before_create :charge_card

  def make_some_cents
    self.amount = self.amount * 100
  end

  def charge_card
  # Create the charge on Stripe's servers - this will charge the user's card
    begin
      Stripe.api_key = ENV["TEST_SECRET"]
      charge = Stripe::Charge.create(
        :amount => self.amount, # amount in cents, again
        :currency => "usd",
        :card => self.token,
        :description => self.nonprofit.name
      )
    rescue Stripe::CardError => e
  # The card has been declined
    end
  end
end
