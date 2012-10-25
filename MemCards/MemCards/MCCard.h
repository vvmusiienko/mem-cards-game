//
//  MCCard.h
//  MemCards
//
//  Created by bogash on 08.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCGameField.h"

@class MCCard;

@protocol MCCardDelegate <NSObject>
//@optional
-(void)cardClicked:(MCCard*) cardSelf;
-(void) test;
@end

@interface MCCard : UIView <UIGestureRecognizerDelegate>
{
    NSString *img_name;
    UIImageView *imageView;
    UIImageView *frontImageView;
    id<MCCardDelegate> delegate;
    BOOL cardIsFlippedUp;
    BOOL cardMayBeClicked;
    int idForCard;
}

-(id)initWithCardId:(int)cardId;
-(void) CardFlipUp;
-(void) CardFlipDown;
-(void) hideImage;
-(IBAction) imageClick:(UIGestureRecognizer *) sender;
-(int) getIdForCard;
-(BOOL) getCardMayBeClicked;
-(BOOL) getCardIsFleppedUp;
-(void) setCardMayBeClicked: (BOOL) changePermission;
@property(nonatomic)id delegate;
@property(readonly) BOOL cardIsFlippedUp;
@property(readonly) BOOL cardMayBeClicked;





@end