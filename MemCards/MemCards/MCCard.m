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
int imageCount=0;
static float zeroPointTwo = 0.2;
@interface MCCard () {
    UIImageView *frontImageView;
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
        NSString *img_name  = [[NSString alloc] initWithFormat:@"card%d", cardId];
        frontImageView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:img_name]];
        frontImageView.tag=cardId;
        imageCount++;
        [frontImageView setAlpha:0.2];
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
-(void) hideCurrent: (UIImageView *) current andLast: (UIImageView *) last {
    
    
}
-(IBAction) imageClick:(UIGestureRecognizer *) sender {
    currentImage = frontImageView;
    if ([currentImage alpha]== zeroPointTwo &&lastSelImage==nil){
        [currentImage setAlpha:1];
        lastSelImage = currentImage;
    } else if ([currentImage alpha]== zeroPointTwo && lastSelImage!=nil && lastSelImage.tag!=currentImage.tag){
        [currentImage setAlpha:1];
        [lastSelImage setAlpha:0.2];
        [currentImage setAlpha:0.2];
        lastSelImage=nil;
        currentImage=nil;
    } else if ([currentImage alpha]== zeroPointTwo && lastSelImage.tag == currentImage.tag){
        [currentImage setAlpha:1];
        imageCount-=2;
        [lastSelImage setHidden:YES];
        [currentImage setHidden:YES];
        lastSelImage=nil;
        currentImage=nil;
        if (imageCount==0) {
        }
        
    }
    
    
}




/*
 NSString *mess = [[NSString alloc] initWithFormat:@"%i", imageCount];
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:mess delegate:nil cancelButtonTitle:@"I'm awesome." otherButtonTitles:nil];
 [alert show];
 */
@end














