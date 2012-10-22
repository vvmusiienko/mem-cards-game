//
//  MCCard.m
//  MemCards
//
//  Created by bogash on 08.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCCard.h"

UIImageView *lastSelImage;
UIImageView *currentImage;
MCCard *lastSelCard;
MCCard *currentCard;
int imageCount=0;

@interface MCCard () {

}
@end

@implementation MCCard
+(MCCard *) sharedCard{
    static MCCard *sharedCard = nil;
    if (sharedCard == nil){
        sharedCard = [[self alloc] init];
    }
    return sharedCard;
}
-(id)initWithCardId:(int)cardId{
    if (self = [super init]) {
        cardStatus = TRUE;
        img_name  = [[NSString alloc] initWithFormat:@"card%d", cardId];
        frontImageView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:img_name]];
        frontImageView.tag=cardId;
        imageCount++;
        frontImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)];
        [frontImageView addGestureRecognizer:tapGesture];
        [self addSubview:frontImageView];
    }
    return self;
}
-(void) setToZeroImageCount{
    imageCount = 0;
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
    cardStatus = TRUE;
}
-(void) CardFlipDown{
    imageView = frontImageView;
    UIImage *secondImage = [UIImage imageNamed:@"BackSide.png"];
    cardStatus = FALSE;
    [UIView transitionWithView:imageView duration:0.75
                       options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                           imageView.image = secondImage;
                       } completion:nil];

}
-(void) hideImage{
    [frontImageView setHidden:YES];
}




-(IBAction) imageClick:(UIGestureRecognizer *) sender {
    
    currentCard = self;
    currentImage = frontImageView;
    if (cardStatus==FALSE && lastSelImage==nil){
        [currentCard CardFlipUp];
        lastSelImage = currentImage;
        lastSelCard = currentCard;
    } else if (cardStatus==FALSE && lastSelImage!=nil && lastSelImage.tag!=currentImage.tag){
        [currentCard CardFlipUp];
        [lastSelCard performSelector:@selector(CardFlipDown) withObject:nil afterDelay:1];
        [currentCard performSelector:@selector(CardFlipDown) withObject:nil afterDelay:1];
        lastSelImage=nil;
        currentImage=nil;
    } else if (cardStatus==FALSE && lastSelImage.tag == currentImage.tag){
        [currentCard CardFlipUp];
        imageCount-=2;
        [currentCard performSelector:@selector(hideImage) withObject:nil afterDelay:1];
        [lastSelCard performSelector:@selector(hideImage) withObject:nil afterDelay:1];
        lastSelImage=nil;
        currentImage=nil;
        if (imageCount==0) {
            //go to LevelEndView
        }
        
    }
}




/*
 //debuger function
 NSString *mess = [[NSString alloc] initWithFormat:@"%i", imageCount];
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:mess delegate:nil cancelButtonTitle:@"I'm awesome." otherButtonTitles:nil];
 [alert show];
 */
@end












