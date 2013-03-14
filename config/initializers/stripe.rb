if Rails.env.to_s == "production"
  Stripe.api_key = ENV['STRIPE_SECRET_KEY']
else
  Stripe.api_key = "foot"
end
STRIPE_PUBLIC_KEY = "pk_B1SaM15nXXruDU3g2D6uns2kJeu9m"