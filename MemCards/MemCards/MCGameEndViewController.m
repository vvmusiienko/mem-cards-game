//
//  MCGameEndViewController.m
//  MemCards
//
//  Created by Jura on 06.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCGameEndViewController.h"

@interface MCGameEndViewController ()

@end

@implementation MCGameEndViewController


@synthesize timeSpent;
@synthesize allscores;

- (void)viewDidLoad

{ 
    [super viewDidLoad];
    [timeSpent setText :@"Waiting result"];
    [allscores setText:@"0"];
    [self saveHighscore];
  
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)saveHighscore{
    
    
    NSString *lastScore = allscores.text;
    //  NSString *gameHighscore = [[NSUserDefaults standardUserDefaults] valueForKey:@"gameHighscore"];
    
    
    
    //  if (([lastScore intValue]>[gameHighscore intValue]) || (gameHighscore==@"Waiting some result"))
    //   {
    [[NSUserDefaults standardUserDefaults] setValue: lastScore forKey:@"gameHighscore"];
    //  }
    
    
    
}

@end