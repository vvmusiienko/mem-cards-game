//
//  MCCard.h
//  MemCards
//
//  Created by bogash on 08.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCGameField.h"


@interface MCCard : UIView<UIGestureRecognizerDelegate>
{
    
}
+(MCCard *) sharedCard;
-(id)initWithCardId:(int)cardId;
-(void) setToZeroImageCount;
@end
