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
    IBOutlet UIView *subView;
    int i,j,f;
    int clicksCount;  
    NSArray *plistWithLevels;
    NSArray *currentLevelSettings;
    //objects needed for gameLogic---------------------------------------------------
    MCCard *lastSelCard;
    MCCard *currentCard;
    int imageCount;
    BOOL cardsMayBeClicked;
   
}
-(IBAction)mainMenuTapped:(id)sender;
-(void)showActivity;
-(void)generateFieldWithCards;
//objects needed for gameLogic--------------------------------------------------
-(void)cardClicked:(MCCard*) cardSelf;

-(void) AnimationForCard:(int)row Row:(int)cell Cell:(MCCard*) card;
-(void) cardsMayBeClickedIsEqualYes;
@property (nonatomic, retain) IBOutlet  UIView *subView;

@end

