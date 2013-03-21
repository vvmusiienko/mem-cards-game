//
//  MCGameViewController.h
//  MemCards
//
//  Created by Guest on 15.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCCard.h"
#import "MCAppDelegate.h"
#import "MCLevelEndViewController.h"

@interface MCGameViewController : UIViewController <MCCardDelegate>{
    IBOutlet UILabel *myTimer;
    IBOutlet UILabel *myScore;

    
    int i,j,f;

    int clicksCount;
 
   

    
    NSArray *plistWithLevels;
    NSArray *currentLevelSettings;
    //objects needed for gameLogic---------------------------------------------------
    MCCard *lastSelCard;
    MCCard *currentCard;
    int imageCount;
    //objects needed for gameLogic---------------------------------------------------
    
}
-(IBAction)mainMenuTapped:(id)sender;
-(void)showActivity;
-(void)generateFieldWithCards;

//objects needed for gameLogic---------------------------------------------------
-(void)cardClicked:(MCCard*) cardSelf;
//objects needed for gameLogic---------------------------------------------------

@end

