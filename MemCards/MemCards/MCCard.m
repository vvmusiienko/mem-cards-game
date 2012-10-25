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

-(id)initWithCardId:(int)cardId{
    if (self = [super init]) {
        [delegate changeCardStatus];
        img_name  = [[NSString alloc] initWithFormat:@"card%d", cardId];
        frontImageView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:img_name]];
        frontImageView.tag=cardId;
        [delegate imageCountPlusPlus];
        frontImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)];
        [frontImageView addGestureRecognizer:tapGesture];
        [self addSubview:frontImageView];
    }
    return self;
}
-(IBAction) imageClick:(UIGestureRecognizer *) sender {
    //[delegate currentCardEqualSelf: self];
    [delegate gameLogic];
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
    [delegate changeCardStatus];
}
-(void) CardFlipDown{
    imageView = frontImageView;
    UIImage *secondImage = [UIImage imageNamed:@"BackSide.png"];
    [delegate changeCardStatus];
    [UIView transitionWithView:imageView duration:0.75
                       options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                           imageView.image = secondImage;
                       } completion:nil];
    [delegate mayBeClickedMethod];
}
-(void) hideImage{
    [UIView beginAnimations: @"identifier" context: @"hideImage"];
    [UIView setAnimationDuration: 0.75];
    [UIView setAnimationRepeatCount: 1];
    frontImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0001, 0.0001);
    [UIView commitAnimations];
    [delegate mayBeClickedMethod];
}



/*
 //debuger function
 NSString *mess = [[NSString alloc] initWithFormat:@"%i", imageCount];
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:mess delegate:nil cancelButtonTitle:@"I'm awesome." otherButtonTitles:nil];
 [alert show];
 */

@end












