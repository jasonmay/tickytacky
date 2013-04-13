//
//  GameViewController.m
//  TickyTacky
//
//  Created by Jason May on 4/11/13.
//  Copyright (c) 2013 Jason May. All rights reserved.
//

#import "GameViewController.h"
#import "SpotButton.h"

@interface GameViewController ()
@end

@implementation GameViewController

@synthesize gameState;
@synthesize turnX;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    for (SpotButton *spot in self.spots) {
        spot.spotState = SPOT_NONE;
        [spot setNeedsDisplay];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // sort by tag for easier victory checking
    NSComparator compareTags = ^(id a, id b) {
        NSInteger aTag = [a tag];
        NSInteger bTag = [b tag];
        return aTag < bTag ? NSOrderedDescending
        : aTag > bTag ? NSOrderedAscending
        : NSOrderedSame;
    };
    self.spots = [self.spots sortedArrayUsingComparator:compareTags];
    
    
    self.gameState = [NSMutableArray array];
    
    self.turnX = YES;
    
    for (NSInteger i = 0; i < 9; i++)
        [self.gameState addObject:[NSNumber numberWithInteger:i+42]];
    for (SpotButton *spot in self.spots)
        spot.spotState = SPOT_NONE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)resign:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Resign" message:@"Seriously?"delegate:nil cancelButtonTitle:@"Keep playing, you wimp" otherButtonTitles:nil, nil];
    [alert show];
}

- (BOOL)checkForVictory
{
    BOOL victories[8][3] = {
        {0, 1, 2},
        {3, 4, 5},
        {6, 7, 8},
        
        {0, 3, 6},
        {1, 4, 7},
        {2, 5, 8},
        
        {0, 4, 8},
        {2, 4, 6},
    };
    
    SpotState stateCheck = self.turnX ? SPOT_X : SPOT_O;
    
    BOOL win = NO;
    for (int v = 0; v < 8; ++v) {
        BOOL consec = YES;
        for (int s = 0; s < 3; ++s) {
            SpotButton *spot = [self.spots objectAtIndex:victories[v][s]];
            if (spot.spotState != stateCheck) {
               
                consec = NO;
                break;
            }
        }
        if (consec) {
            win = YES;
            break;
        }
    }
    
    if (win) {
        NSString *winMessage =
            stateCheck == SPOT_X ? @"X Wins!" : @"O Wins!";
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Victory!" message:winMessage delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil, nil];
        [alert show];
        return YES;
    }
    else {
        BOOL draw = YES;
        for (SpotButton *spot in self.spots) {
            if (spot.spotState == SPOT_NONE) {
                draw = NO;
                break;
            }
        }
        if (draw) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Too bad" message:@"It's a draw!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil, nil];
            [alert show];
            return YES;
        }
    }
    return NO;
}

- (IBAction)chooseSpot:(SpotButton *)sender {
    if (sender.spotState == SPOT_NONE) {
        sender.spotState = self.turnX ? SPOT_X : SPOT_O;
        
        [sender setNeedsDisplay];
        [self checkForVictory];
        
        self.turnX = !self.turnX;
        
    }
}
@end
