//transfer setup
function stripeResponseHandlerTSU(status, response) {
  var $form = $('#nonprofit-form');
  if (response.error) {
    // Show the errors on the form
    $form.find('.payment-errors').text(response.error.message);
    $form.find('button').prop('disabled', false);
  } else {
    // response contains id and card, which contains additional card details
    var token = response.id;
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="nonprofit[token]" />').val(token));
    // and submit
    $form.get(0).submit();
  }
};

//subscriptions
function stripeResponseHandlerSubs(status, response) {
  var $form = $('#payment-form-sub');
  if (response.error) {
    // Show the errors on the form
    $form.find('.payment-errors').text(response.error.message);
    $form.find('button').prop('disabled', false);
  } else {
    // response contains id and card, which contains additional card details
    var token = response.id;
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="subscription[token]" />').val(token));
    // and submit
    $form.get(0).submit();
  }
};

//donation
function stripeResponseHandler(status, response) {
  var $form = $('#payment-form');
  if (response.error) {
    // Show the errors on the form
    $form.find('.payment-errors').text(response.error.message);
    $form.find('button').prop('disabled', false);
  } else {
    // response contains id and card, which contains additional card details
    var token = response.id;
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="donation[token]" />').val(token));
    // and submit
    $form.get(0).submit();
  }
};

// transfer setup
jQuery(function($) {
  console.log('document ready!');
  $('#nonprofit-form').submit(function(event) {
    console.log('I submitted the form!')
    var $form = $(this);
    // Disable the submit button to prevent repeated clicks
    $form.find('button').prop('disabled', true);
    console.log('I am about to create the token')
    Stripe.card.createToken($form, stripeResponseHandlerTSU);
    // Prevent the form from submitting with the default action
    return false;
  });
});


//subscriptions

jQuery(function($) {
  $('#payment-form-sub').submit(function(event) {
    var $form = $(this);
    // Disable the submit button to prevent repeated clicks
    $form.find('button').prop('disabled', true);
    Stripe.card.createToken($form, stripeResponseHandlerSubs);
    // Prevent the form from submitting with the default action
    return false;
  });
});

//donations
jQuery(function($) {
  $('#payment-form').submit(function(event) {
    var $form = $(this);
    // Disable the submit button to prevent repeated clicks
    $form.find('button').prop('disabled', true);
    Stripe.card.createToken($form, stripeResponseHandler);
    // Prevent the form from submitting with the default action
    return false;
  });
});
