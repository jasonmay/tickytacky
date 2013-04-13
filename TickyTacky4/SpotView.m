//
//  SpotView.m
//  TickyTacky
//
//  Created by Jason May on 4/12/13.
//  Copyright (c) 2013 Jason May. All rights reserved.
//

#import "SpotView.h"

@implementation SpotView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef c = UIGraphicsGetCurrentContext();

    CGFloat topMargin = 10.0f;
    CGFloat bottomMargin = 60.0f;
    CGFloat leftMargin = 5.0f;
    CGFloat rightMargin = 5.0f;

    CGFloat w = rect.size.width - leftMargin - rightMargin;
    CGFloat h = rect.size.height - topMargin - bottomMargin;

    CGFloat leftVert  = leftMargin + w / 3;
    CGFloat rightVert = leftMargin + w / 3 * 2;

    CGFloat bottomHoriz = topMargin + h / 3;
    CGFloat topHoriz    = topMargin + h / 3 * 2;

    CGFloat white[4] = {1.0f, 1.0f, 1.0f, 1.0f};
    CGContextSetStrokeColor(c, white);
    CGContextBeginPath(c);

    CGContextSetLineWidth(c, 1.0f);

    CGContextMoveToPoint(c, leftVert, topMargin);
    CGContextAddLineToPoint(c, leftVert, rect.size.height - bottomMargin);

    CGContextMoveToPoint(c, rightVert, topMargin);
    CGContextAddLineToPoint(c, rightVert, rect.size.height - bottomMargin);

    CGContextMoveToPoint(c, leftMargin, topHoriz);
    CGContextAddLineToPoint(c, rect.size.width - rightMargin, topHoriz);

    CGContextMoveToPoint(c, leftMargin, bottomHoriz);
    CGContextAddLineToPoint(c, rect.size.width - rightMargin, bottomHoriz);
    
    CGContextStrokePath(c);
}


@end
