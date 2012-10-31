//
//  MCCard.m
//  MemCards
//
//  Created by bogash on 08.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCCard.h"


@implementation MCCard
@synthesize delegate;
@synthesize cardIsFlippedUp;
@synthesize cardMayBeClicked;

-(id)initWithCardId:(int)cardId{
    if (self = [super init]) {
        cardIsFlippedUp = YES;
        img_name  = [[NSString alloc] initWithFormat:@"card%d", cardId];
        frontImageView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:img_name]];
        idForCard = cardId;
        frontImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)];
        [frontImageView addGestureRecognizer:tapGesture];
        [self addSubview:frontImageView];
        [self definitionOfPlaceMove:cardId];
    }
    return self;
}
-(IBAction) imageClick:(UIGestureRecognizer *) sender {
    [delegate cardClicked:self];
}

- (void)moveImage:(UIImageView *)image duration:(NSTimeInterval)duration
            curve:(int)curve x:(CGFloat)x y:(CGFloat)y
{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    CGAffineTransform transform = CGAffineTransformMakeTranslation(x, y);
    image.transform = transform;
    
    [UIView commitAnimations];
    
}

-(void) definitionOfPlaceMove: (int) cardId{
    if (cardId<=2 && cardId > 0) {
        [self moveImage:frontImageView duration:2.5
                  curve:UIViewAnimationCurveEaseOut x:-500 y:500];
    } else {
        if (cardId <= 4 && cardId > 2) {
            [self moveImage:frontImageView duration:2.5
                      curve:UIViewAnimationCurveEaseInOut x:400 y:400];
        } else {
            if (cardId<=6 && cardId >4) {
                [self moveImage:frontImageView duration:2.5
                          curve:UIViewAnimationCurveEaseInOut x:300 y:-400];
            } else {
                [self moveImage:frontImageView duration:2.5
                          curve:UIViewAnimationCurveEaseInOut x:-500 y:-500];
                
            }
        }
    }
}

- (void) setFrame:(CGRect)frame
{
    [super setFrame:frame];
    frontImageView.frame = CGRectMake(0.0f, 0.0f, frame.size.width, frame.size.height);
}


-(void) CardFlipUp{
    imageView = frontImageView;
    UIImage *secondImage = [UIImage imageNamed:img_name];
    
    [UIView transitionWithView:imageView duration:0.75
                       options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                           imageView.image = secondImage;
                       } completion:nil];
    cardIsFlippedUp = YES;
}
-(void) CardFlipDown{
    imageView = frontImageView;
    UIImage *secondImage = [UIImage imageNamed:@"BackSide.png"];
    cardIsFlippedUp = NO;
    [UIView transitionWithView:imageView duration:0.75
                       options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                           imageView.image = secondImage;
                       } completion:nil];
    cardMayBeClicked = YES;
}
-(void) hideImage{
    [UIView beginAnimations: @"identifier" context: @"hideImage"];
    [UIView setAnimationDuration: 0.75];
    [UIView setAnimationRepeatCount: 1];
    frontImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0001, 0.0001);
    [UIView commitAnimations];
    cardMayBeClicked = YES;
}
-(int) getIdForCard{
    return idForCard;
}
-(BOOL) getCardMayBeClicked{
    return cardMayBeClicked;
}
-(void) setCardMayBeClicked: (BOOL) changePermission {
    cardMayBeClicked = changePermission;
}
-(BOOL) getCardIsFleppedUp{
    return cardIsFlippedUp;
}
/*
 //debuger function
 NSString *mess = [[NSString alloc] initWithFormat:@"%i", imageCount];
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:mess delegate:nil cancelButtonTitle:@"I'm awesome." otherButtonTitles:nil];
 [alert show];
 */



@end










