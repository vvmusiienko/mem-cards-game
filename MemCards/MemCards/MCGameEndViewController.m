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
    [allscores setText:@"Waiting result"];
  
	// Do any additional setup after loading the view, typically from a nib.
}

@end