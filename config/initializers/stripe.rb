Rails.configuration.stripe = {
  :publishable_key => ENV['TEST_PUBLISHABLE'],
  :secret_key      => ENV['TEST_SECRET']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
