//
//  SpotButton.m
//  TickyTacky
//
//  Created by Jason May on 4/12/13.
//  Copyright (c) 2013 Jason May. All rights reserved.
//

#import "SpotButton.h"

@implementation SpotButton

@synthesize spotState;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawX:(CGRect)rect {
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGFloat pad = rect.size.height / 4.0f;
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    
    CGFloat purple[4] = {1.0f, 0.0f, 1.0f, 0.8f};
    CGContextSetStrokeColor(c, purple);
    CGContextBeginPath(c);
    
    CGContextSetLineWidth(c, 8.0f);
    
    CGContextMoveToPoint(c, pad, pad);
    CGContextAddLineToPoint(c, w - pad, h - pad);
    
    CGContextMoveToPoint(c, w - pad, pad);
    CGContextAddLineToPoint(c, pad, h - pad);
    
    CGContextStrokePath(c);
}

- (void)drawO:(CGRect)rect {
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGFloat pad = rect.size.height / 4.0f;
    
    CGFloat orange[4] = {1.0f, 0.6f, 0.0f, 0.8f};
    CGContextSetStrokeColor(c, orange);
    CGContextBeginPath(c);
    
    CGContextSetLineWidth(c, 8.0f);
    
    CGRect paddedRect = CGRectMake(rect.origin.x + pad, rect.origin.y + pad, rect.size.width - pad * 2, rect.size.height - pad * 2);
    CGContextAddEllipseInRect(c, paddedRect);
    
    CGContextStrokePath(c);
}

- (void)drawRect:(CGRect)rect
{
    if (self.spotState == SPOT_X) {
        [self drawX:rect];
    }
    else if (self.spotState == SPOT_O) {
        [self drawO:rect];
    }
    
}


@end
