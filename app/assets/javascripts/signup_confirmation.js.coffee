# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  signup_confirmation.setupForm()

signup_confirmation =
  setupForm: ->
    $('#new_signup_confirmation').submit ->
      $('input[type=submit]').attr('disabled', true)
      signup.processCard()

  processCard: ->
    alert("second")
    card =
      {number: $('#credit_card').val()
      cvc: $('#cvc_code').val()
      expMonth: $('#expires_month').val()
      expYear: $('#expires_year').val()}
    Stripe.createToken(card, signup.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    alert(status)
    if status == 200
      alert(response.id)
    else
      alert("boo")
      alert(response.error.message)