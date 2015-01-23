//
//  PTKPaymentField.h
//  PTKPayment Example
//
//  Created by Alex MacCaw on 1/22/13.
//  Copyright (c) 2013 Stripe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTKCard.h"
#import "PTKCardNumber.h"
#import "PTKCardExpiry.h"
#import "PTKCardCVC.h"
#import "PTKAddressZip.h"
#import "PTKUSAddressZip.h"

@class PTKView, PTKTextField;

@protocol PTKViewDelegate <NSObject>
@optional
- (void)paymentView:(PTKView *)paymentView withCard:(PTKCard *)card isValid:(BOOL)valid;
@end

@interface PTKView : UIView

- (BOOL)isValid;

@property (nonatomic, readonly) UIView *opaqueOverGradientView;
@property (nonatomic, readonly) PTKCardNumber *cardNumber;
@property (nonatomic, readonly) PTKCardExpiry *cardExpiry;
@property (nonatomic, readonly) PTKCardCVC *cardCVC;
@property (nonatomic, readonly) PTKAddressZip *addressZip;

@property (nonatomic, retain) IBOutlet UIView *innerView;
@property (nonatomic, retain) IBOutlet UIView *clipView;
@property (nonatomic, retain) IBOutlet PTKTextField *cardNumberField;
@property (nonatomic, retain) IBOutlet PTKTextField *cardExpiryField;
@property (nonatomic, retain) IBOutlet PTKTextField *cardCVCField;
@property (nonatomic, retain) IBOutlet UIImageView *placeholderView;
@property (nonatomic,retain) id <PTKViewDelegate> delegate;
@property (readonly) PTKCard *card;

@end
