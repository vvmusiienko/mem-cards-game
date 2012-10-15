//
//  MCGameViewController.m
//  MemCards
//
//  Created by Guest on 15.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCGameViewController.h"

@interface MCGameViewController ()

@end

@implementation MCGameViewController

-(void)showActivity{
    i = [myTimer.text intValue];
    j = [myScore.text intValue];
    
    int newTime = i + 1;
	
    myTimer.text = [NSString stringWithFormat:@"%d", newTime];
    myScore.text=[NSString stringWithFormat:@"%d",j];
    }

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    i=0;j=0;
    [super viewDidLoad];
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showActivity) userInfo: nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
