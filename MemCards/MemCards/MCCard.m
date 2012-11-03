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

@implementation MCCard
@synthesize delegate;
@synthesize cardIsFlippedUp;


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
     //   [self definitionOfPlaceMove:cardId];
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
}
-(void) hideImage{
    [UIView beginAnimations: @"identifier" context: @"hideImage"];
    [UIView setAnimationDuration: 0.75];
    [UIView setAnimationRepeatCount: 1];
    frontImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0001, 0.0001);
    [UIView commitAnimations];
}
-(int) getIdForCard{
    return idForCard;
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

/* //debuger function
 NSString *mess = [[NSString alloc] initWithFormat:@"%i", imageCount];
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:mess delegate:nil cancelButtonTitle:@"I'm awesome." otherButtonTitles:nil];
 [alert show];
 */



@end










