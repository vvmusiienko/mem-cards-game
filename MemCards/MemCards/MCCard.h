//
//  MCCard.h
//  MemCards
//
//  Created by bogash on 08.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCGameField.h"
@protocol MCCardDelegate <NSObject>
@required

    -(void) gameLogic;
@end

@interface MCCard : UIView <UIGestureRecognizerDelegate>
{
    NSString *img_name;
    UIImageView *imageView;
    @public
    UIImageView *frontImageView;
    id<MCCardDelegate> delegate;
}

-(id)initWithCardId:(int)cardId;
-(void) CardFlipUp;
-(void) CardFlipDown;
-(void) hideImage;
-(IBAction) imageClick:(UIGestureRecognizer *) sender;
@property(retain)id delegate;



@end
