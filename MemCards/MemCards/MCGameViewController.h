//
//  MCGameViewController.h
//  MemCards
//
//  Created by Guest on 15.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCCard.h"

@interface MCGameViewController : UIViewController <MCCardDelegate>{
    IBOutlet UILabel *myTimer;
    IBOutlet UILabel *myScore;
    
    int i,j;
    
   NSArray *plistWithLevels;

//objects needed for gameLogic---------------------------------------------------
    BOOL cardStatus;
    MCCard *lastSelCard;
    MCCard *currentCard;
    int imageCount;
    BOOL mayBeClicked;
//objects needed for gameLogic---------------------------------------------------    

}
-(IBAction)mainMenuTapped:(id)sender;
-(void)showActivity;
-(void)generateFieldWithCards;

//objects needed for gameLogic---------------------------------------------------
-(void) changeCardStatus;
-(void) mayBeClickedMethod;
-(void) imageCountPlusPlus;
-(void) gameLogic;
//-(void) currentCardEqualSelf: (UIView*) current;
//objects needed for gameLogic---------------------------------------------------

@end
