/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2015 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "ComPayStripeView.h"
@implementation ComPayStripeView

-(PTKView*) stripeView
{
    if( !_stripeView)
    {
        //NSLog(@"INITIALIZING VIEW %@",[self frame]);
        _stripeView = [[PTKView alloc] initWithFrame:[self frame]];
        
        [self addSubview:_stripeView];
        
        [_stripeView setDelegate:self];
        
    }
    //NSLog(@"INITIALIZING VIEW2 %@",[self frame]);
    return _stripeView;
    
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{    if (self.stripeView != nil) {
        
        // You must call the special method 'setView:positionRect' against
        // the TiUtils helper class. This method will correctly layout your
        // child view within the correct layout boundaries of the new bounds
        // of your view.
        [TiUtils setView:self.stripeView positionRect:bounds];
        
    }
}


- (void) paymentView:(PTKView *)paymentView withCard:(PTKCard *)card isValid:(BOOL)valid
{
    
    if ([self.proxy _hasListeners:@"cardDetails"])
    {
        // fire event
        if(valid)
        {
            [self.proxy fireEvent:@"cardDetails" withObject:@{
                                                           @"carNumber":card.number,
                                                           @"expMonth":NUMLONG(card.expMonth),
                                                           @"expYear":NUMLONG(card.expYear),
                                                           @"cvc":card.cvc
                                                            }];
        }
    }
    
    
}
- (void)sendValidation:(id)args
{
    if(![self.stripeView isValid]) {
        return;
    }
}
@end
