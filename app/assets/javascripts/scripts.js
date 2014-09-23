function stripeResponseHandler(status, response) {
  var $form = $('#payment-form');
  console.log('in the callback...')
  if (response.error) {
    console.log('...and there were errors!')
    // Show the errors on the form
    $form.find('.payment-errors').text(response.error.message);
    $form.find('button').prop('disabled', false);
  } else {
    console.log('...and there were NO errors!!!')
    // response contains id and card, which contains additional card details
    var token = response.id;
    console.log('Here is the token: ' + token)
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="donation[token]" />').val(token));
    // and submit
    $form.get(0).submit();
  }
};

jQuery(function($) {
  console.log('document ready!');
  $('#payment-form').submit(function(event) {
    console.log('I submitted the form!')
    var $form = $(this);

    // Disable the submit button to prevent repeated clicks
    $form.find('button').prop('disabled', true);
    console.log('I am about to create the token')
    Stripe.card.createToken($form, stripeResponseHandler);

    // Prevent the form from submitting with the default action
    return false;
  });
});
