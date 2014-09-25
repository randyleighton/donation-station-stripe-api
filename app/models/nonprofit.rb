class Nonprofit < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true

  has_many :donations
  has_many :subscriptions

  before_create :transfer_setup

  def transfer_setup
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://dashboard.stripe.com/account
    Stripe.api_key = ENV["TEST_SECRET"]
    binding.pry
    # Get the bank account details submitted by the form
    token_id = params[:stripeToken]

    # Create a Recipient
    recipient = Stripe::Recipient.create(
      :name => self.name,
      :type => "non-profit",
      :email => self.email,
      :bank_account => token_id
    )
  end

end
