//
//  MCViewController.h
//  MemCards
//
//  Created by Vova Musiienko on 28.09.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCViewController : UIViewController
  IBOutlet UILabel * time;
	NSTimer * myTicker;
  IBOutlet UILabel * score; 
	
	int Score;
	

-(void)viewDidLoad;
-(void)showActivity;
-(void)score;
@end
@end
