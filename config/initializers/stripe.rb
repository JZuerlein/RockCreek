if Rails.env.to_s == "production"
  Stripe.api_key = "sk_test_qHdeDWtJDQbCA1sVZRNpeKGn"
else
  Stripe.api_key = "sk_test_qHdeDWtJDQbCA1sVZRNpeKGn"
end
STRIPE_PUBLIC_KEY = "pk_test_cZ8D0YdtAYofPno7oQ0iDWhu"