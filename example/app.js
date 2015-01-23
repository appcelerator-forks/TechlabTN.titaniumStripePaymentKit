var CEStripeIOS = require('com.pay.stripe');
var stripeView = CEStripeIOS.createView({
	top : 40,
	width : Ti.UI.FILL,
	height : Ti.UI.FILL
});
stripeView.addEventListener('cardDetails', function(e) {
	Ti.API.debug('carNumber: ', e.carNumber);
	Ti.API.debug('expMonth: ', e.expMonth);
	Ti.API.debug('expYear: ', e.expYear);
	Ti.API.debug('cvc: ', e.cvc);

});
var win = Ti.UI.createWindow({
	backgroundColor : "#FFF"
});
win.add(stripeView);
win.open();

