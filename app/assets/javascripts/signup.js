/**
 * Created with JetBrains RubyMine.
 * User: Jeff
 * Date: 3/28/13
 * Time: 10:52 AM
 * To change this template use File | Settings | File Templates.
 */
$(function() {
    $("#credit-card input, #credit-card select").attr("disabled", false);


    $("form:has(#credit-card)").submit(function() {
        alert("Made it here.")
        var form = this;
        $("#register_button").attr("disabled", true);
        $("#credit-card input, #credit-card select").attr("name", "");
        $("#credit-card-errors").hide();


        //if (!$("#credit-card").is(":visible")) {
        //    $("#credit-card input, #credit-card select").attr("disabled", true);
        //    return true;
        //}

        var card = {
            number:   $("#credit_card").val(),
            expMonth: $("#expires_month").val(),
            expYear:  $("#expires_year").val(),
            cvc:      $("#cvc_code").val()
        };

        Stripe.createToken(card, function(status, response) {
            if (status === 200) {
                alert("success");
                $("#signup_last_four_digits").val(response.card.last4);
                $("#signup_stripe_token").val(response.id);
                form.submit();
            } else {
                alert("response.error.message");
                $("#stripe-error-message").text(response.error.message);
                $("#credit-card-errors").show();
                $("#register_button").attr("disabled", false);
            }
        });

        return false;
    });


    $("#change-card a").click(function() {
        $("#change-card").hide();
        $("#credit-card").show();
        $("#credit_card_number").focus();
        return false;
    });
});
