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




- (void)viewDidLoad

{ 
    [super viewDidLoad];
 
  
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)setalltime:(int)alltime{
    [all_time setText:[NSString stringWithFormat:@"%d",alltime]];
}
-(void)setallscores:(int)allscores{
    [all_scores setText:[NSString stringWithFormat:@"%d",allscores]];
}
@end