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
@optional
-(void)cardClicked:(MCCard*) cardSelf;
@end

@interface MCCard : UIView <UIGestureRecognizerDelegate>
{
    NSString *img_name;
    UIImageView *imageView;
    UIImageView *frontImageView;
    id<MCCardDelegate> delegate;
    BOOL cardIsFlippedUp;
    int idForCard;
}
-(id)initWithCardId:(int)cardId;
-(void) CardFlipUp;
-(void) CardFlipDown;
-(void) hideImage;
-(IBAction) imageClick:(UIGestureRecognizer *) sender;
-(int) getIdForCard;
-(BOOL) getCardIsFleppedUp;
@property(nonatomic)id delegate;
@property(readonly) BOOL cardIsFlippedUp;



@end