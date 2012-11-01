//
//  MCLevelEndViewController.h
//  MemCards
//
//  Created by Coder on 18.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCAppDelegate.h"
@interface MCLevelEndViewController : UIViewController
{
    IBOutlet   UILabel *moves_done;
    IBOutlet   UILabel *time_spend_for_level;
    IBOutlet   UILabel *time_left;
    IBOutlet   UILabel *scores_for_this_level;
    
    int i,j,k,z;
}

-(void) setMovesDone:(int)movesDone;
-(void) setTimeSpend:(int)timeSpend; // in seconds
-(void) setTimeForLevel:(int)timeForLevel; //Min time to pass level in second
-(void) setScores:(int)scores;
-(void) startExtraScoresAnim;

- (IBAction)nextLevelTapped:(id)sender;


@end
