//
//  SpotButton.h
//  TickyTacky4
//
//  Created by Jason May on 4/12/13.
//  Copyright (c) 2013 Jason May. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {SPOT_NONE, SPOT_X, SPOT_O} SpotState;

@interface SpotButton : UIButton
@property (nonatomic) SpotState spotState;
@end
