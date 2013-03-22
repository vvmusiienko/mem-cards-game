//
//  MCCard.m
//  MemCards
//
//  Created by bogash on 08.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCCard.h"
#import "MCAppDelegate.h"
#include <QuartzCore/QuartzCore.h>
#import <QuartzCore/CoreAnimation.h>    

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
        [self getRounding];
        [self addSubview:frontImageView];
    }
    return self;
}
-(IBAction) imageClick:(UIGestureRecognizer *) sender {
    [delegate cardClicked:self];
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
    UIImage *secondImage =imageShirt;
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
-(void) getRounding{
    CALayer * ourLayer = [self layer]; 
    ourLayer.cornerRadius = 8.0f;               
    ourLayer.masksToBounds = YES;               
    ourLayer.borderWidth = 0.0f;            
}
-(void)shake
{
    CGFloat t = 5.0;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, t);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, --t, -t);
    
    self.transform = translateLeft;
    
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:10.0];
        self.transform = translateRight;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}
/*
 //debuger function
 NSString *mess = [[NSString alloc] initWithFormat:@"%i", imageCount];
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:mess delegate:nil cancelButtonTitle:@"I'm awesome." otherButtonTitles:nil];
 [alert show];
 */

@end










