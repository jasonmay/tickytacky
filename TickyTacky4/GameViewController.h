//
//  GameViewController.h
//  TickyTacky
//
//  Created by Jason May on 4/11/13.
//  Copyright (c) 2013 Jason May. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GameViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) NSMutableArray *gameState;
@property (nonatomic) BOOL turnX;

- (IBAction)resign:(id)sender;
- (IBAction)chooseSpot:(UIButton *)sender;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *spots;

@end
