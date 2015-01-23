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
{
    //NSLog(@"[VIEW LIFECYCLE EVENT] frameSizeChanged: %@", stripeView);
    
    if (self.stripeView != nil) {
        
        // You must call the special method 'setView:positionRect' against
        // the TiUtils helper class. This method will correctly layout your
        // child view within the correct layout boundaries of the new bounds
        // of your view.
        [TiUtils setView:self.stripeView positionRect:bounds];
        
        //PTKView *oldView = stripeView;
        //stripeView removeFromSuperview];
        //stripeView = [[PTKView alloc] initWithFrame:bounds];
        
        //[self addSubview:stripeView];
        //[stripeView setDelegate:self];
        
        //[self.stripeView setFrame:bounds];
        
    }
    //NSLog(@"[VIEW LIFECYCLE EVENT] frameSizeChanged2: %@", self.stripeView);
}


- (void) paymentView:(PTKView *)paymentView withCard:(PTKCard *)card isValid:(BOOL)valid
{
    
    if ([self.proxy _hasListeners:@"cardIsValid"])
    {
        // fire event
        [self.proxy fireEvent:@"cardIsValid" withObject:@{
                                                          @"value":NUMBOOL(valid)
                                                          }];
    }
    
    
}

@end
