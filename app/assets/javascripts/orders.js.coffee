# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	# find stripe key and run setup function
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  payment.setupForm()

payment =
  setupForm: ->
  	# while checking the credit card the form isn't submitted
    $('#new_order').submit ->
        $('input[type=submit]').attr('disabled', true)
        Stripe.card.createToken($('#new_order'), payment.handleStripeResponse)
        false

  handleStripeResponse: (status, response) ->
  	# if card is ok, then cool! if not, display error message
    if status == 200
      $('#new_order').append($('<input type="hidden" name="stripeToken" />').val(response.id))
      $('#new_order')[0].submit()
    else
      $('#stripe_error').text(response.error.message).show()
      $('input[type=submit]').attr('disabled', false)

      # testing
      #  4242424242424242
      # visa