if Rails.env.to_s == "production"
  Stripe.api_key = ENV['STRIPE_SECRET_KEY']
else
  Stripe.api_key = "boot"
end
STRIPE_PUBLIC_KEY = "pk_test_cZ8D0YdtAYofPno7oQ0iDWhu"