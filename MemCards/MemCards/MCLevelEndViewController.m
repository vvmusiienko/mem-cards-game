//
//  MCLevelEndViewController.m
//  MemCards
//
//  Created by Coder on 18.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCLevelEndViewController.h"

@interface MCLevelEndViewController ()

@end

@implementation MCLevelEndViewController



- (void)viewDidLoad

{ i=0,j=15,k=0,z=0;
    [super viewDidLoad];
    
    [self setMovesDone:i];
    [self setTimeSpend:j];
    [self setTimeForLevel:k];
    [self setScores:z];
    
}

-(void) setMovesDone:(int)movesDone{
    [moves_done setText:[NSString stringWithFormat:@"%d", movesDone]];
}

-(void) setTimeSpend:(int)timeSpend{
    [time_spend_for_level setText:[NSString stringWithFormat:@"%d", timeSpend]];
}

-(void) setTimeForLevel:(int)timeForLevel{
    [time_left setText:[NSString stringWithFormat:@"%d", timeForLevel]];
    
    if ([time_spend_for_level.text intValue] >0) {
        
        [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(startExtraScoresAnim) userInfo:nil repeats:YES];
        
        
        
    }
}
-(void) setScores:(int)scores{
    [scores_for_this_level setText:[NSString stringWithFormat:@"%d", scores]];
}





-(void) startExtraScoresAnim{
    
    int currentTime = [time_spend_for_level.text intValue];
    int currentScores = [scores_for_this_level.text intValue];
    
    
    if (currentTime>0) {
        
        int newScores = currentScores + 10;
        int newTime = currentTime - 1;
        
        time_spend_for_level.text = [NSString stringWithFormat:@"%d", newTime];
        
        scores_for_this_level.text = [NSString stringWithFormat:@"%d", newScores];}
    
    
    
}

- (IBAction)nextLevelTapped:(id)sender {
      levelId=levelId+1;
}


@end